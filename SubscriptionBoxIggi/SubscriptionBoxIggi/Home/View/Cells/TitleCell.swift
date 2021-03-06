//
//  TitleCell.swift
//  SubscriptionBoxIggi
//
//  Created by apple on 3/2/21.
//

import UIKit


class TitleCell: UICollectionViewCell {
    static var identifier: String = "TitleCell"
    @IBOutlet private var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func set(title: String) {
        lblTitle.text = title
    }

}
