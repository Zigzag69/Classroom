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
        return counter
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return mediaContent.count
        case 1:
            return attachmentsContent.count
        case 2:
            return linksContent.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            switch indexPath.section {
            case 0:
                return returnMediaCollectionViewCell(indexPath: indexPath)
            case 1:
                return returnAttachmentsCollectionViewCell(indexPath: indexPath)
            case 2:
                return returnLinksCollectionViewCell(indexPath: indexPath)
            default:
                preconditionFailure()
            }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let header = classroomCV.dequeueReusableSupplementaryView(ofKind: kind,
            withReuseIdentifier: "CollectionReusableView", for: indexPath) as! CollectionReusableView
        header.title.text = headerNames[indexPath.section]
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width
        switch indexPath.section {
        case 0:
            return CGSize(width: width / 2 - 24, height: 162)
        case 1:
            return CGSize(width: width - 32, height: 56)
        case 2:
            return CGSize(width: width - 32, height: 300)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
}
