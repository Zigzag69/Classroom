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
    
//MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        preparations()
    }
    
//MARK: - UI Preparations
    func preparations() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .blackOpaque
        navigationBar.setBackgroundImage(#imageLiteral(resourceName: "gadient 1px"),
                                         for: .default)
    }
}
