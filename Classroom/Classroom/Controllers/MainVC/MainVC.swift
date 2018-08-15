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
    
//MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        preparations()
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
}

