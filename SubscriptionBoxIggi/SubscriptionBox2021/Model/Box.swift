//
//  Box.swift
//  SubscriptionBoxIggi
//
//  Created by apple on 3/2/21.
//

import Foundation


struct Box{
    var date: Date
    var items: [BoxItem]
    var imageStr: String
    
    //Computed property to return date as String
    var dateString: String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyy"
        return formatter.string(from: date)
    }
}

struct BoxItem{
    var name: String
    var categories: [Category]
    var description: String
    var isFavorite: Bool
}

enum Category: String, CaseIterable{
    case food = "candy"
    case meds = "savoury"
    case accessories = "sizess"
    case toys = "toys"
    case grooming = "gadgets"
    
    func displayName() -> String{
        return self.rawValue.capitalized
    }
}
