//
//  CategoryCell.swift
//  SubscriptionBoxIggi
//
//  Created by apple on 2/28/21.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static var identifier: String = "CategoryCell"
    var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    var textLabel: UILabel = {
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = UIColor(named: "white")
        textLabel.textAlignment = .center
        return textLabel
    }()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var stack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = UIColor(named: "grey")
        self.contentView.addSubview(backView)
        backView.addSubview(stack)
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(textLabel)
       
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            backView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            stack.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
            stack.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            stack.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalTo: stack.heightAnchor, multiplier: 0.6),
            imageView.widthAnchor.constraint(equalTo: stack.widthAnchor),
            textLabel.widthAnchor.constraint(equalTo: stack.widthAnchor)
        ])
      
    }
    
    func setContent(category: Category){
        imageView.image = UIImage(named: "\(category.rawValue)")
        textLabel.text = "\(category.displayName())"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
  
    func selectionChanged(selected: Bool){
        if selected {
            self.contentView.backgroundColor = UIColor(named: "purple")
        }else{
            self.contentView.backgroundColor = UIColor(named: "grey")

        }
    }
    
}
