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
        switch section {
        case 0:
            return 4
        case 1:
            return 2
        case 2:
            return 1
        default:
            return 2
        }
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
                cell.contentImage.image = #imageLiteral(resourceName: "TestImage5")
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
}
