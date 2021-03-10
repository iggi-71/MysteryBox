//
//  LoginVC.swift
//  SubscriptionBoxIggi
//
//  Created by apple on 2/28/21.
//

import UIKit

class LoginVC: UIViewController {
    
    let logoImage: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "mysterybox")
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    let username: UITextField = {
        let txt = UITextField()
        txt.tintColor = UIColor(named: "white")
        txt.textColor = UIColor(named: "white")
        txt.autocapitalizationType = .none
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "light_grey")!])
        return txt
    }()
    
    let password: UITextField = {
        let txt = UITextField()
        txt.tintColor = UIColor(named: "white")
        txt.textColor = UIColor(named: "white")
        txt.isSecureTextEntry = true
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "light_grey")!])
        return txt
    }()
    
    let button : UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor(named: "black"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(named: "white")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "blue")
        setStackView()
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    func setStackView(){
        self.view.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalTo: self.view.layoutMarginsGuide.widthAnchor, multiplier: 0.65).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.view.layoutMarginsGuide.heightAnchor, multiplier: 0.7).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.addArrangedSubview(logoImage)
        logoImage.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.6).isActive = true
        stackView.addArrangedSubview(username)
        stackView.addArrangedSubview(password)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        stackView.addArrangedSubview(button)
        
    }
    
    @objc func login(){
        UIApplication.shared.windows.first?.rootViewController = TabBarController()
    }
}
