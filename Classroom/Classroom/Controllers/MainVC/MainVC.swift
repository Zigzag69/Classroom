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

    let sectionNames = ["Media", "Attachments", "Links"]
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
        addPicker(tag: 1)
    }
    
    @IBAction func tapTimePicker() {
        addPicker(tag: 2)
    }
    
    @IBAction func tapFirstSetReminder() {
        let alertController = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
        let noneActionSheet = UIAlertAction(title: "None",
                                            style: .default) { action in
            self.firstNoneLabel.text = "None"
        }
        let atTimeOfEventActionSheet = UIAlertAction(title: "At time of event",
                                            style: .default) { action in
            self.firstNoneLabel.text = "At time of event"
        }
        let tenMinutesActionSheet = UIAlertAction(title: "10 minutes before",
                                            style: .default) { action in
            self.firstNoneLabel.text = "10 minutes before"
        }
        let thirtyMinutesActionSheet = UIAlertAction(title: "30 minutes before",
                                            style: .default) { action in
            self.firstNoneLabel.text = "30 minutes before"
        }
        let oneHourActionSheet = UIAlertAction(title: "1 hour before",
                                            style: .default) { action in
            self.firstNoneLabel.text = "1 hour before"
        }
        let oneDayActionSheet = UIAlertAction(title: "1 day before",
                                            style: .default) { action in
            self.firstNoneLabel.text = "1 day before"
        }
        let twoDayActionSheet = UIAlertAction(title: "2 days before",
                                              style: .default) { action in
            self.firstNoneLabel.text = "2 days before"
        }
        let twoWeekActionSheet = UIAlertAction(title: "2 week before",
                                              style: .default) { action in
            self.firstNoneLabel.text = "2 week before"
        }
        let cancelActionSheet = UIAlertAction(title: "Cancel",
                                              style: .cancel,
                                              handler: nil)

        alertController.addAction(noneActionSheet)
        alertController.addAction(atTimeOfEventActionSheet)
        alertController.addAction(tenMinutesActionSheet)
        alertController.addAction(thirtyMinutesActionSheet)
        alertController.addAction(oneHourActionSheet)
        alertController.addAction(oneDayActionSheet)
        alertController.addAction(twoDayActionSheet)
        alertController.addAction(twoWeekActionSheet)
        alertController.addAction(cancelActionSheet)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func tapSecondSetReminder() {
        print("2")
    }
}
