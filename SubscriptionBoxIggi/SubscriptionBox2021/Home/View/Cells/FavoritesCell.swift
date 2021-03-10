//
//  FavoritesCell.swift
//  SubscriptionBoxIggi
//
//  Created by apple on 3/2/21.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    static var identifier: String = "FavoritesCell"
    @IBOutlet weak var imgView: UIImageView!

    @IBOutlet weak var title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup(){
        //title.text = "hello"
    }
    
}
