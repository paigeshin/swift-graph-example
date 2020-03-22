//
//  ViewController.swift
//  popup-practice1
//
//  Created by shin seunghyun on 2020/03/17.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showPopup(_ sender: UIButton) {

        let popupViewController = UIStoryboard(name: "Popup", bundle: nil).instantiateViewController(identifier: "PopupViewController") as! PopupViewController
        
        //현재 viewController 위에서 나오게 하기.
        popupViewController.modalPresentationStyle = .overCurrentContext
        
        self.present(popupViewController, animated: false, completion: nil)
        

    }
    
}

