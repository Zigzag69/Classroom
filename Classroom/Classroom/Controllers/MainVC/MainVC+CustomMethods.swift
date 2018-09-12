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
    
    func returnMediaCollectionViewCell(indexPath: IndexPath) -> UICollectionViewCell {
        let cell = classroomCV.dequeueReusableCell(withReuseIdentifier: "MediaCollectionViewCell", for: indexPath) as! MediaCollectionViewCell
        cell.contentImage.image = mediaContent[indexPath.row]
        cell.mediaView.layer.borderWidth = 1
        cell.mediaView.layer.cornerRadius = 2
        cell.mediaView.layer.borderColor = UIColor(red: 196/255,
                                                   green: 199/255,
                                                   blue: 204/255,
                                                   alpha: 1).cgColor
        return cell
    }
    
    func returnAttachmentsCollectionViewCell(indexPath: IndexPath) -> UICollectionViewCell {
        let cell = classroomCV.dequeueReusableCell(withReuseIdentifier: "AttachmentsCollectionViewCell", for: indexPath) as! AttachmentsCollectionViewCell
        cell.title.text = attachmentsContent[indexPath.row]
        return cell
    }
    
    func returnLinksCollectionViewCell(indexPath: IndexPath) -> UICollectionViewCell {
        let cell = classroomCV.dequeueReusableCell(withReuseIdentifier: "LinksCollectionViewCell", for: indexPath) as! LinksCollectionViewCell
        cell.contentImage.image = #imageLiteral(resourceName: "TestImage5")
        cell.title.text = "The choices range from high end department store brands, to affordable names brands."
        cell.siteLabel.text = linksContent[indexPath.row]
        cell.linksView.layer.borderWidth = 1
        cell.linksView.layer.cornerRadius = 2
        cell.linksView.layer.borderColor = UIColor(red: 196/255,
                                                   green: 199/255,
                                                   blue: 204/255,
                                                   alpha: 1).cgColor
        return cell
    }

    func tapSetReminder(handler: @escaping (UIAlertAction) -> Void) {
        let alertController = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "None", style: .default, handler: handler))
        alertController.addAction(UIAlertAction(title: "At time of event",
                                                style: .default,
                                                handler: handler))
        alertController.addAction(UIAlertAction(title: "10 minutes before",
                                                style: .default,
                                                handler: handler))
        alertController.addAction(UIAlertAction(title: "30 minutes before",
                                                style: .default,
                                                handler: handler))
        alertController.addAction(UIAlertAction(title: "1 hour before",
                                                style: .default,
                                                handler: handler))
        alertController.addAction(UIAlertAction(title: "1 day before",
                                                style: .default,
                                                handler: handler))
        alertController.addAction(UIAlertAction(title: "2 days before",
                                                style: .default,
                                                handler: handler))
        alertController.addAction(UIAlertAction(title: "2 week before",
                                                style: .default,
                                                handler: handler))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func tapFirstActionSheet(_ sender: UIAlertAction) {
        firstNoneLabel.text = sender.title
    }
    
    @objc func tapSecondActionSheet(_ sender: UIAlertAction) {
        secondNoneLabel.text = sender.title
    }
    
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        if Date().timeIntervalSince(sender.date) < 86400 {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEE, d MMMM yyyy"
            dateLabel.text = dateFormatter.string(from: sender.date)
        }
        
//        if NSDate().compare(sender.date) != ComparisonResult.orderedDescending {
//            dateLabel.text = selectedDate
//        }
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
        textView.sizeThatFits(CGSize(width: textView.frame.size.width,
                                     height: CGFloat.greatestFiniteMagnitude))
        let newSize = textView.sizeThatFits(CGSize(width: textView.frame.size.width,
                                                   height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, textView.frame.size.width),
                               height: newSize.height)
        textView.frame = newFrame
    }
}
