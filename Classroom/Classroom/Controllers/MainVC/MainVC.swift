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
    @IBOutlet weak var classroomCV: UICollectionView!
    @IBOutlet weak var classroomCVHeight: NSLayoutConstraint!
    
    let mediaCollectionViewCellID = "MediaCollectionViewCell"
    let attachmentsCollectionViewCellID = "AttachmentsCollectionViewCell"
    let linksCollectionViewCellID = "LinksCollectionViewCell"
    let sectionHeaderID = "CollectionReusableView"
    let sectionNames = ["Media", "Attachments", "Links"]
    let mediaContent = [#imageLiteral(resourceName: "TestImage1"), #imageLiteral(resourceName: "TestImage2"), #imageLiteral(resourceName: "TestImage3"), #imageLiteral(resourceName: "TestImage4")]
    let attachmentsContent = ["Harry Potter and the prisoner…", "Harry Potter and the prisoner…"]
    let linksContent = ["healthyfood.com"]
    
//MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        preparations()
        registerCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .blackOpaque
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
//MARK: - UI Preparations
    func preparations() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        
        gradient.layer.shadowColor = UIColor.lightGray.cgColor
        gradient.layer.shadowRadius = 2
        gradient.layer.shadowOpacity = 0.5
        gradient.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        let height = classroomCV.collectionViewLayout.collectionViewContentSize.height
        classroomCVHeight.constant = height
    }
    
//MARK: - Custom methods
    func registerCells() {
        let mediaNibCell = UINib(nibName: mediaCollectionViewCellID, bundle: nil)
        let attachmentsNibCell = UINib(nibName: attachmentsCollectionViewCellID, bundle: nil)
        let linksNibCell = UINib(nibName: linksCollectionViewCellID, bundle: nil)
        let nibSectionHeader = UINib(nibName: sectionHeaderID, bundle: nil)
        classroomCV.register(mediaNibCell, forCellWithReuseIdentifier: mediaCollectionViewCellID)
        classroomCV.register(attachmentsNibCell,
                             forCellWithReuseIdentifier: attachmentsCollectionViewCellID)
        classroomCV.register(linksNibCell, forCellWithReuseIdentifier: linksCollectionViewCellID)
        classroomCV.register(nibSectionHeader, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: sectionHeaderID)
    }
}

extension MainVC: UITextViewDelegate {
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
