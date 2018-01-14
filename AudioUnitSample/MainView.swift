import UIKit

class MainView: UIView {

    lazy var playButton: UIButton = {
        let playButton = UIButton()
        playButton.setTitle("Play", for: .normal)
        playButton.setTitleColor(.blue, for: .normal)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        return playButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(playButton)
        
        setupCustomConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCustomConstraints() {
        playButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        playButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
