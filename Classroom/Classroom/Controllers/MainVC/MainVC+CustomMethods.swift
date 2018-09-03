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
                picker.timeZone = NSTimeZone.local
                picker.backgroundColor = UIColor.white
                secondPaddingView.addSubview(picker)
                timePickerIsActivated = true
            } else {
                secondPaddingView.viewWithTag(tag)?.removeFromSuperview()
                secondPaddingHeight.constant = 20
                timePickerIsActivated = false
            }
        }
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, d MMMM yyyy"
        let selectedDate = dateFormatter.string(from: sender.date)
        dateLabel.text = selectedDate
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
