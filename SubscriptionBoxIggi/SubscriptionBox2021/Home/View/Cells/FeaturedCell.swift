//
//  FeaturedCell.swift
//  SubscriptionBoxIggi
//
//  Created by apple on 3/2/21.
//

import UIKit

class FeaturedCell: UICollectionViewCell {
    static var identifier: String = "FeaturedCell"
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    func setContents(category: Category){
        imgView.image = UIImage(named: category.rawValue)
        mainLabel.text = category.displayName()
    }
    func setup(){
        self.backView.backgroundColor = UIColor(named: "forest")
        self.backView.layer.cornerRadius = 20
        mainLabel.textColor = UIColor(named: "white")
    }
}
