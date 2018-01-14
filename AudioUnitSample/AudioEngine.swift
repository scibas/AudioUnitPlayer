import Foundation
import AVFoundation

class AudioEngine {
    
    private let engine = AVAudioEngine()
    private let player = AVAudioPlayerNode()
    private let reverb = AVAudioUnitReverb()
    
    var reverbDryWetMix: Float {
        set { reverb.wetDryMix = newValue }
        get { return reverb.wetDryMix }
    }
    
    init() {
        AVAudioSession.configureAudioSession()
        
        engine.attach(player)
        engine.attach(reverb)
        
        engine.connect(player, to: reverb, format: nil)
        engine.connect(reverb, to: engine.mainMixerNode, format: nil)
        
        reverb.loadFactoryPreset(.smallRoom)
        
        try! engine.start()
    }
    
    func play() {
        AVAudioSession.setActive(true)
        
        let fileURL = Bundle.main.url(forResource: "drumLoop", withExtension: "caf")
        
        let file = try! AVAudioFile(forReading: fileURL!)
        
        player.scheduleFile(file, at: nil) {
            self.play()
        }

        player.play()
    }

    private func setSessionActive(_ active: Bool) {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(active)
        }
        catch {
            fatalError("Could not set Audio Session active \(active). error: \(error).")
        }
    }
}
