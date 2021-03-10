//
//  OnboardingPageView.swift
//  SubscriptionBoxIggi
//
//  Created by apple on 2/28/21.

import UIKit

class OnboardingPageView: UIView {
    
    var pageColor: UIColor? = UIColor.white
    var message: String!
    var isLastPage: Bool!
    var imageName: String!
    
    let button : UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(UIColor(named: "black"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(named: "white")
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(message: String, imageName: String, backgroundColor: UIColor, isLastPage: Bool){
        self.init(frame: .zero)
        self.message = message
        self.imageName = imageName
        self.backgroundColor = backgroundColor
        self.isLastPage = isLastPage
        self.setup()
    }
    
    func setup(){
        self.translatesAutoresizingMaskIntoConstraints = true
        let stackView : UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 20
            stackView.distribution = .fill
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        let messageLabel: UILabel = {
            let messageLabel = UILabel()
            messageLabel.numberOfLines = 0
            messageLabel.textAlignment = .center
            messageLabel.font = UIFont(name: "Helvetica", size: 20)
            messageLabel.textColor = UIColor(white: 1.0, alpha: 0.8)
            return messageLabel
        }()
        
        self.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor, multiplier: 0.65).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.layoutMarginsGuide.heightAnchor, multiplier: 0.7).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        stackView.addArrangedSubview(imageView)
        imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.6).isActive = true
        stackView.addArrangedSubview(messageLabel)
        
        if isLastPage{
            button.heightAnchor.constraint(equalToConstant: 40).isActive = true
            stackView.addArrangedSubview(button)
        }
        
        imageView.image = UIImage(named: imageName)
        messageLabel.text = message
        self.backgroundColor = backgroundColor
    }
}
