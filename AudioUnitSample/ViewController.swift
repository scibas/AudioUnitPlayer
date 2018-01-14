import UIKit

class ViewController: UIViewController {
    let audioEngine: AudioEngine
    
    
    init() {
        audioEngine = AudioEngine()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let mainView = MainView()
        mainView.playButton.addTarget(self, action: #selector(playButtonDidTap(sender:)), for: .touchUpInside)
        mainView.slider.addTarget(self, action: #selector(sliderValueDidChange(sender:)), for: .valueChanged)
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc private func playButtonDidTap(sender: UIButton) {
        audioEngine.play()
    }
    
    @objc private func sliderValueDidChange(sender: UISlider) {
        audioEngine.reverbDryWetMix = sender.value
    }
}

