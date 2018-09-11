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
        return headerNames.count
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
                let cell = classroomCV.dequeueReusableCell(withReuseIdentifier: "MediaCollectionViewCell", for: indexPath) as! MediaCollectionViewCell
                cell.contentImage.image = mediaContent[indexPath.row]
                cell.mediaView.layer.borderWidth = 1
                cell.mediaView.layer.cornerRadius = 2
                cell.mediaView.layer.borderColor = UIColor(red: 196/255,
                                                           green: 199/255,
                                                           blue: 204/255,
                                                           alpha: 1).cgColor
                return cell
            case 1:
                let cell = classroomCV.dequeueReusableCell(withReuseIdentifier: "AttachmentsCollectionViewCell", for: indexPath) as! AttachmentsCollectionViewCell
                cell.title.text = attachmentsContent[indexPath.row]
                return cell
            case 2:
                let cell = classroomCV.dequeueReusableCell(withReuseIdentifier: "LinksCollectionViewCell", for: indexPath) as! LinksCollectionViewCell
                cell.contentImage.image = #imageLiteral(resourceName: "TestImage5")
                cell.title.text = "The choices range from high end department store brands, to affordable names brands."
                cell.siteLabel.text = linksContent[indexPath.row]
                cell.linksView.layer.borderWidth = 1
                cell.linksView.layer.cornerRadius = 2
                cell.linksView.layer.borderColor = UIColor(red: 196/255,
                                                           green: 199/255,
                                                           blue: 204/255,
                                                           alpha: 1).cgColor
                return cell
            default:
                let cell = classroomCV.dequeueReusableCell(withReuseIdentifier: "MediaCollectionViewCell", for: indexPath) as! MediaCollectionViewCell
                return cell
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
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
        if mediaContent.isEmpty == false {
            return CGSize(width: classroomCV.frame.width, height: 44)
        } else {
            return CGSize.zero
        }
        case 1:
        if attachmentsContent.isEmpty == false {
            return CGSize(width: classroomCV.frame.width, height: 44)
        } else {
            return CGSize.zero
        }
        case 2:
        if linksContent.isEmpty == false {
            return CGSize(width: classroomCV.frame.width, height: 44)
        } else {
            return CGSize.zero
        }
        default:
        return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            let width = UIScreen.main.bounds.size.width
            return CGSize(width: width / 2 - 24, height: 162)
        case 1:
            let width = UIScreen.main.bounds.size.width
            return CGSize(width: width - 32, height: 56)
        case 2:
            let width = UIScreen.main.bounds.size.width
            return CGSize(width: width - 32, height: 300)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
}
