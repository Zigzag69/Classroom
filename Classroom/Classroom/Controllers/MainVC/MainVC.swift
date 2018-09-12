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
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var gradient: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var datePickerButton: UIButton!
    @IBOutlet weak var dueTimePicker: UIButton!
    @IBOutlet weak var firstPaddingView: UIView!
    @IBOutlet weak var firstPaddingHeight: NSLayoutConstraint!
    @IBOutlet weak var secondPaddingView: UIView!
    @IBOutlet weak var secondPaddingHeight: NSLayoutConstraint!
    @IBOutlet weak var firstNoneLabel: UILabel!
    @IBOutlet weak var secondNoneLabel: UILabel!
    @IBOutlet weak var classroomCV: UICollectionView!
    @IBOutlet weak var classroomCVHeight: NSLayoutConstraint!

    var counter = 3
    var mediaContent = [#imageLiteral(resourceName: "TestImage1"), #imageLiteral(resourceName: "TestImage2"), #imageLiteral(resourceName: "TestImage3"), #imageLiteral(resourceName: "TestImage4")]
    var attachmentsContent = ["Harry Potter and the prisoner…", "Harry Potter and the prisoner…"]
    var linksContent = ["healthyfood.com"]
    var datePickerIsActivated = false
    var timePickerIsActivated = false
    
//MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preparations()
        registerCells()
        updateHeight()
        hideKeyboard()
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
    }
    
//MARK: - IBActions
    @IBAction func deletePhoto() {
        if mediaContent.isEmpty == false  {
            mediaContent.removeLast()
            if mediaContent.isEmpty {
                counter = counter - 1
            }
        }
        if attachmentsContent.isEmpty == false {
            attachmentsContent.removeLast()
            if attachmentsContent.isEmpty {
                counter = counter - 1
            }
        }
        if linksContent.isEmpty == false {
            linksContent.removeLast()
            if linksContent.isEmpty {
                counter = counter - 1
            }
        }
        classroomCV.reloadData()
        updateHeight()
    }
    
    @IBAction func addNewPhoto() {
        if mediaContent.isEmpty {
            counter = counter + 1
        }
        if attachmentsContent.isEmpty {
            counter = counter + 1
        }
        if linksContent.isEmpty {
            counter = counter + 1
        }
        mediaContent.append(#imageLiteral(resourceName: "TestImage5"))
        attachmentsContent.append("Harry Potter and the prisoner…")
        linksContent.append("healthyfood.com")
        classroomCV.reloadData()
        updateHeight()
    }

    @IBAction func tapDatePicker() {
        addPicker(tag: 1)
    }
    
    @IBAction func tapTimePicker() {
        addPicker(tag: 2)
    }
    
    @IBAction func tapFirstSetReminderButton() {
        tapSetReminder(handler: tapFirstActionSheet)
    }
    
    @IBAction func tapSecondSetReminderButton() {
        tapSetReminder(handler: tapSecondActionSheet)
    }
}
