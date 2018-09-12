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
            if mediaContent.isEmpty == false {
                return mediaContent.count
            } else if attachmentsContent.isEmpty == false {
                return attachmentsContent.count
            } else {
                return linksContent.count
            }
        case 1:
            if mediaContent.isEmpty || attachmentsContent.isEmpty{
                return linksContent.count
            } else {
                return attachmentsContent.count
            }
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
                if mediaContent.isEmpty {
                    if attachmentsContent.isEmpty {
                        return returnLinksCollectionViewCell(indexPath: indexPath)
                    } else {
                        return returnAttachmentsCollectionViewCell(indexPath: indexPath)
                    }
                } else {
                    return returnMediaCollectionViewCell(indexPath: indexPath)
                }
            case 1:
                if mediaContent.isEmpty || attachmentsContent.isEmpty {
                    return returnLinksCollectionViewCell(indexPath: indexPath)
                } else {
                    return returnAttachmentsCollectionViewCell(indexPath: indexPath)
                }
            case 2:
                return returnLinksCollectionViewCell(indexPath: indexPath)
            default:
                return returnMediaCollectionViewCell(indexPath: indexPath)
            }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let header = classroomCV.dequeueReusableSupplementaryView(ofKind: kind,
            withReuseIdentifier: "CollectionReusableView", for: indexPath) as! CollectionReusableView
        switch indexPath.section {
        case 0:
            if mediaContent.isEmpty == false {
                header.title.text = "Media"
                return header
            } else if attachmentsContent.isEmpty == false {
                header.title.text = "Attachments"
                return header
            } else {
                header.title.text = "Links"
                return header
            }
        case 1:
            if mediaContent.isEmpty || attachmentsContent.isEmpty{
                header.title.text = "Links"
                return header
            } else {
                header.title.text = "Attachments"
                return header
            }
        case 2:
            header.title.text = "Links"
            return header
        default:
            return header
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width
        switch indexPath.section {
        case 0:
            if mediaContent.isEmpty == false {
                return CGSize(width: width / 2 - 24, height: 162)
            } else if attachmentsContent.isEmpty == false {
                return CGSize(width: width - 32, height: 56)
            } else {
               return CGSize(width: width - 32, height: 300)
            }
        case 1:
            if mediaContent.isEmpty || attachmentsContent.isEmpty{
                return CGSize(width: width - 32, height: 300)
            } else {
                return CGSize(width: width - 32, height: 56)
            }
        case 2:
           return CGSize(width: width - 32, height: 300)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
}
