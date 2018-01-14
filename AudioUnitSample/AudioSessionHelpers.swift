import AVFoundation

extension AVAudioSession {
    static func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        } catch {
            print("Cannot configure audio session. \(error)")
        }
    }
    
    static func setActive(_ active: Bool) {
        do {
            try AVAudioSession.sharedInstance().setActive(active)
        } catch {
            let newState = active ? "active" : "inactive"
            print("Cannot set audiosession to \(newState) state")
        }
    }
}

