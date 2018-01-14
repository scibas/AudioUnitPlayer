import UIKit

class MainView: UIView {

    lazy var playButton: UIButton = {
        let playButton = UIButton()
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setTitle("Play", for: .normal)
        playButton.setTitleColor(.blue, for: .normal)
        playButton.setTitleColor(.lightGray, for: .highlighted)
        return playButton
    }()
    
    lazy var slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 100
        return slider
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(playButton)
        addSubview(slider)
    
        setupCustomConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCustomConstraints() {
        playButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        playButton.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        slider.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 50).isActive = true
        slider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        slider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
    }
}
