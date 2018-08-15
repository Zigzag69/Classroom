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
    
    let collectionViewCellID = "CollectionViewCell"
    
//MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        preparations()
        registerCell()
    }
    
//MARK: - UI Preparations
    func preparations() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .blackOpaque
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        gradient.layer.shadowColor = UIColor.lightGray.cgColor
        gradient.layer.shadowRadius = 2
        gradient.layer.shadowOpacity = 0.5
        gradient.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
//MARK: - Custom methods
    func registerCell() {
        let nibCell = UINib(nibName: collectionViewCellID, bundle: nil)
        classroomCV.register(nibCell, forCellWithReuseIdentifier: collectionViewCellID)
    }
}

