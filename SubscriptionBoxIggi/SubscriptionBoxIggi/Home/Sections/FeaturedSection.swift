//
//  FeaturedSection.swift
//  SubscriptionBoxIggi
//
//  Created by apple on 3/2/21.
//

import UIKit

struct FeaturedSection: Section {
    var numberOfItems: Int
    let items: [Category]!
    
    init(items: [Category]) {
        self.items = items
        self.numberOfItems = items.count
    }
    
    func layoutSection() -> NSCollectionLayoutSection {
        // Step 1
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        // Step 2
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Step 3
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(220), heightDimension: .absolute(300))
        
        // Step 4
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Step 5
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FeaturedCell.self), for: indexPath) as? FeaturedCell
        cell?.setContents(category: items[indexPath.item])
        return cell!
    }
    
    
}
