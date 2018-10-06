//
//  AboutViewController.swift
//  SimpleGallery
//
//  Created by Ahmed Labib on 10/6/18.
//  Copyright © 2018 Ahmed Labib. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var emailTitleLabel: UILabel!
    @IBOutlet weak var versionNumberTitleLabel: UILabel!
    @IBOutlet weak var buildNumberTitleLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var versionNumberLabel: UILabel!
    @IBOutlet weak var buildNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "ABOUT".localized()
        setupOutletsTexts()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        DispatchQueue.main.async {
            setupCirlceFor(self.profileImageView)
            setupRoundedCornerFor(self.containerView)
        }
    }
    
    func setupOutletsTexts() {
        nameTitleLabel.text = "NAME".localized()
        emailTitleLabel.text = "EMAIL".localized()
        versionNumberTitleLabel.text = "VERSION_NUMBER".localized()
        buildNumberTitleLabel.text = "BUILD_NUMBER".localized()
        
        nameLabel.text = "Ahmed Labib"
        emailLabel.text = "a.a.labib@hotmail.com"
        let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
        versionNumberLabel.text = appVersion
        let Build = Bundle.main.infoDictionary!["CFBundleVersion"] as? String
        buildNumberLabel.text = Build
    }
    
    
}
