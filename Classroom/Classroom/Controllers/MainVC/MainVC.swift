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
    @IBOutlet weak var datePickerButton: UIButton!
    @IBOutlet weak var dueTimePicker: UIButton!
    @IBOutlet weak var firstPaddingView: UIView!
    @IBOutlet weak var firstPaddingHeight: NSLayoutConstraint!
    @IBOutlet weak var secondPaddingView: UIView!
    @IBOutlet weak var secondPaddingHeight: NSLayoutConstraint!
    @IBOutlet weak var classroomCV: UICollectionView!
    @IBOutlet weak var classroomCVHeight: NSLayoutConstraint!

    let sectionNames = ["Media", "Attachments", "Links"]
    var mediaContent = [#imageLiteral(resourceName: "TestImage1"), #imageLiteral(resourceName: "TestImage2"), #imageLiteral(resourceName: "TestImage3"), #imageLiteral(resourceName: "TestImage4")]
    var attachmentsContent = ["Harry Potter and the prisoner…", "Harry Potter and the prisoner…"]
    var linksContent = ["healthyfood.com"]
    
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
        if mediaContent.isEmpty == false && attachmentsContent.isEmpty == false && linksContent.isEmpty == false {
            mediaContent.removeLast()
            attachmentsContent.removeLast()
            linksContent.removeLast()
            classroomCV.reloadData()
            updateHeight()
        }
    }
    
    @IBAction func addNewPhoto() {
        mediaContent.append(#imageLiteral(resourceName: "TestImage5"))
        attachmentsContent.append("Harry Potter and the prisoner…")
        linksContent.append("google.com")
        classroomCV.reloadData()
        updateHeight()
    }

    @IBAction func tapDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.tag = 1
        if firstPaddingHeight.constant == 20 {
            firstPaddingHeight.constant = 200
            datePicker.timeZone = NSTimeZone.local
            datePicker.backgroundColor = UIColor.white
            datePicker.addTarget(self,
                                 action: #selector(datePickerValueChanged(_:)),
                                 for: .valueChanged)
            firstPaddingView.addSubview(datePicker)
        } else if firstPaddingHeight.constant == 200 {
            firstPaddingView.viewWithTag(1)?.removeFromSuperview()
            firstPaddingHeight.constant = 20
        }
    }
    
    @IBAction func tapTimePicker() {
        let timePicker = UIDatePicker()
        timePicker.tag = 2
        if secondPaddingHeight.constant == 20 {
            secondPaddingHeight.constant = 200
            timePicker.timeZone = NSTimeZone.local
            timePicker.backgroundColor = UIColor.white
            secondPaddingView.addSubview(timePicker)
        } else if secondPaddingHeight.constant == 200 {
            secondPaddingView.viewWithTag(2)?.removeFromSuperview()
            secondPaddingHeight.constant = 20
        }
    }
}
