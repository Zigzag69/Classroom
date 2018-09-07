//
//  MainVC+CustomMethods.swift
//  Classroom
//
//  Created by PAMacBook on 30.08.18.
//  Copyright © 2018 Zigzag. All rights reserved.
//

import UIKit

extension MainVC: UITextViewDelegate {
    func registerCells() {
        let mediaNibCell = UINib(nibName: "MediaCollectionViewCell", bundle: nil)
        let attachmentsNibCell = UINib(nibName: "AttachmentsCollectionViewCell", bundle: nil)
        let linksNibCell = UINib(nibName: "LinksCollectionViewCell", bundle: nil)
        let nibSectionHeader = UINib(nibName: "CollectionReusableView", bundle: nil)
        classroomCV.register(mediaNibCell, forCellWithReuseIdentifier: "MediaCollectionViewCell")
        classroomCV.register(attachmentsNibCell,
                             forCellWithReuseIdentifier: "AttachmentsCollectionViewCell")
        classroomCV.register(linksNibCell, forCellWithReuseIdentifier: "LinksCollectionViewCell")
        classroomCV.register(nibSectionHeader, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "CollectionReusableView")
    }
    
    func updateHeight() {
        classroomCVHeight.constant = classroomCV.collectionViewLayout.collectionViewContentSize.height
        view.layoutIfNeeded()
    }
    
    func hideKeyboard() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(gesture)
    }
    
    func addPicker(tag: Int) {
        let picker = UIDatePicker()
        picker.tag = tag
        if tag == 1 {
            if datePickerIsActivated == false {
                firstPaddingHeight.constant = 200
                picker.datePickerMode = .date
                picker.timeZone = NSTimeZone.local
                picker.backgroundColor = UIColor.white
                picker.addTarget(self,
                                 action: #selector(datePickerValueChanged(_:)),
                                 for: .valueChanged)
                firstPaddingView.addSubview(picker)
                datePickerIsActivated = true
            } else {
                firstPaddingView.viewWithTag(tag)?.removeFromSuperview()
                firstPaddingHeight.constant = 20
                datePickerIsActivated = false
            }
        } else if tag == 2 {
            if timePickerIsActivated == false {
                secondPaddingHeight.constant = 200
                picker.datePickerMode = .time
                picker.timeZone = NSTimeZone.local
                picker.backgroundColor = UIColor.white
                picker.addTarget(self,
                                 action: #selector(timePickerValueChanged(_:)),
                                 for: .valueChanged)
                secondPaddingView.addSubview(picker)
                timePickerIsActivated = true
            } else {
                secondPaddingView.viewWithTag(tag)?.removeFromSuperview()
                secondPaddingHeight.constant = 20
                timePickerIsActivated = false
            }
        }
    }
    
    func tapFirstSetReminder() {
        let alertController = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
        let noneActionSheet = UIAlertAction(title: "None",
                                            style: .default,
                                            handler: tapFirstActionSheet)
        let atTimeOfEventActionSheet = UIAlertAction(title: "At time of event",
                                                     style: .default,
                                                     handler: tapFirstActionSheet)
        let tenMinutesActionSheet = UIAlertAction(title: "10 minutes before",
                                                  style: .default,
                                                  handler: tapFirstActionSheet)
        let thirtyMinutesActionSheet = UIAlertAction(title: "30 minutes before",
                                                     style: .default,
                                                     handler: tapFirstActionSheet)
        let oneHourActionSheet = UIAlertAction(title: "1 hour before",
                                               style: .default,
                                               handler: tapFirstActionSheet)
        let oneDayActionSheet = UIAlertAction(title: "1 day before",
                                              style: .default,
                                              handler: tapFirstActionSheet)
        let twoDayActionSheet = UIAlertAction(title: "2 days before",
                                              style: .default,
                                              handler: tapFirstActionSheet)
        let twoWeekActionSheet = UIAlertAction(title: "2 week before",
                                               style: .default,
                                               handler: tapFirstActionSheet)
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
    
    func tapSecondSetReminder() {
        let alertController = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
        let noneActionSheet = UIAlertAction(title: "None",
                                            style: .default,
                                            handler: tapSecondActionSheet)
        let atTimeOfEventActionSheet = UIAlertAction(title: "At time of event",
                                                     style: .default,
                                                     handler: tapSecondActionSheet)
        let tenMinutesActionSheet = UIAlertAction(title: "10 minutes before",
                                                  style: .default,
                                                  handler: tapSecondActionSheet)
        let thirtyMinutesActionSheet = UIAlertAction(title: "30 minutes before",
                                                     style: .default,
                                                     handler: tapSecondActionSheet)
        let oneHourActionSheet = UIAlertAction(title: "1 hour before",
                                               style: .default,
                                               handler: tapSecondActionSheet)
        let oneDayActionSheet = UIAlertAction(title: "1 day before",
                                              style: .default,
                                              handler: tapSecondActionSheet)
        let twoDayActionSheet = UIAlertAction(title: "2 days before",
                                              style: .default,
                                              handler: tapSecondActionSheet)
        let twoWeekActionSheet = UIAlertAction(title: "2 week before",
                                               style: .default,
                                               handler: tapSecondActionSheet)
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
    
    @objc func tapFirstActionSheet(_ sender: UIAlertAction) {
        firstNoneLabel.text = sender.title
    }
    
    @objc func tapSecondActionSheet(_ sender: UIAlertAction) {
        secondNoneLabel.text = sender.title
    }
    
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, d MMMM yyyy"
        let selectedDate = dateFormatter.string(from: sender.date)
        dateLabel.text = selectedDate
    }
    
    @objc func timePickerValueChanged(_ sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        let selectedTime = timeFormatter.string(from: sender.date)
        timeLabel.text = selectedTime
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth,
                                                   height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame
    }
}
