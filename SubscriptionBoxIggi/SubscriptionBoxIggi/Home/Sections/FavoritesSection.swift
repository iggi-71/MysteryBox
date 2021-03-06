//
//  FavoritesSection.swift
//  SubscriptionBoxIggi
//
//  Created by apple on 3/2/21.
//

import UIKit

struct FavoritesSection: Section {
   let numberOfItems = 6
     
     func layoutSection() -> NSCollectionLayoutSection {
         let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
         
         let item = NSCollectionLayoutItem(layoutSize: itemSize)
         
         // Step 1
         let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalHeight(0.34))
         
         // Step 2
         let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)
         
         // Step 3
         let section = NSCollectionLayoutSection(group: group)
         section.orthogonalScrollingBehavior = .groupPaging
         section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
         return section
     }
     
     func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
         collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FavoritesCell.self), for: indexPath)
     }
}
