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
            switch indexPath.section {
            case 0:
                let cell = classroomCV.dequeueReusableCell(withReuseIdentifier: mediaCollectionViewCellID, for: indexPath) as! MediaCollectionViewCell
                cell.contentImage.image = mediaContent[indexPath.row]
                return cell
            case 1:
                let cell = classroomCV.dequeueReusableCell(withReuseIdentifier: attachmentsCollectionViewCellID, for: indexPath) as! AttachmentsCollectionViewCell
                return cell
            case 2:
                let cell = classroomCV.dequeueReusableCell(withReuseIdentifier: linksCollectionViewCellID, for: indexPath) as! LinksCollectionViewCell
                return cell
            default:
                let cell = classroomCV.dequeueReusableCell(withReuseIdentifier: mediaCollectionViewCellID, for: indexPath) as! MediaCollectionViewCell
                return cell
            }
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
