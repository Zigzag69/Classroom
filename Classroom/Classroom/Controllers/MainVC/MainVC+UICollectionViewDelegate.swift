//
//  MainVC+UICollectionViewDelegate.swift
//  Classroom
//
//  Created by PAMacBook on 15.08.18.
//  Copyright © 2018 Zigzag. All rights reserved.
//

import UIKit

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return mediaContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = classroomCV.dequeueReusableCell(withReuseIdentifier: collectionViewCellID,
                                                    for: indexPath) as! CollectionViewCell
        cell.image.image = mediaContent[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let header = classroomCV.dequeueReusableSupplementaryView(ofKind: kind,
            withReuseIdentifier: sectionHeaderID, for: indexPath) as! CollectionReusableView
        header.title.text = sectionNames[indexPath.section]
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didDeselectItemAt indexPath: IndexPath) {
    }
    

    

}
