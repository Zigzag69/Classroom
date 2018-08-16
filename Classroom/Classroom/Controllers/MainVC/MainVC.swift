//
//  MainVC.swift
//  Classroom
//
//  Created by PAMacBook on 10.08.18.
//  Copyright © 2018 Zigzag. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var gradient: UIImageView!
    @IBOutlet weak var classroomCV: UICollectionView!
    @IBOutlet weak var classroomCVHeight: NSLayoutConstraint!
    
    let collectionViewCellID = "CollectionViewCell"
    let sectionHeaderID = "CollectionReusableView"
    
//MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        preparations()
        registerCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .blackOpaque
    }
    
//MARK: - UI Preparations
    func preparations() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        
        gradient.layer.shadowColor = UIColor.lightGray.cgColor
        gradient.layer.shadowRadius = 2
        gradient.layer.shadowOpacity = 0.5
        gradient.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        let height = classroomCV.collectionViewLayout.collectionViewContentSize.height
        classroomCVHeight.constant = height
    }
    
//MARK: - Custom methods
    func registerCells() {
        let nibCell = UINib(nibName: collectionViewCellID, bundle: nil)
        classroomCV.register(nibCell, forCellWithReuseIdentifier: collectionViewCellID)
        classroomCV.register(CollectionReusableView.self,
                             forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                             withReuseIdentifier: sectionHeaderID)
    }
}

