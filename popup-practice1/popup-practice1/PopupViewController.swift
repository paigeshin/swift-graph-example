//
//  PopupViewController.swift
//  popup-practice1
//
//  Created by shin seunghyun on 2020/03/17.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var centerY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerY.constant = 1000

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        centerY.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
}
