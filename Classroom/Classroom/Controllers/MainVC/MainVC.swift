//
//  MainVC.swift
//  Classroom
//
//  Created by PAMacBook on 10.08.18.
//  Copyright © 2018 Zigzag. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
//MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        preparations()
    }
    
//MARK: - UI Preparations
    func preparations() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .blackOpaque
    }
}
