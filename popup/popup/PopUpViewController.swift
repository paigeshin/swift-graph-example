
//
//  PopUpViewController.swift
//  popup
//
//  Created by shin seunghyun on 2020/03/17.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    @IBOutlet weak var popupImage: UIImageView!
    @IBOutlet weak var popupImageHeight: NSLayoutConstraint!
    @IBOutlet weak var popupCenterY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupCenterY.constant = 1000
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //view를 동적으로 control 하고 싶을 때, 무조건 viewDidAppear에다가 값을 넣어야지 제대로 된 결과를 얻을 수 있다.
        //        setDialogView()
        
        popupCenterY.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    func setDialogView() {
        //고정 크기로 height을 잡았을 때, 동적으로 height 값을 바꿔주기.
        let ratio = popupImage.image!.size.width / popupImage.frame.size.width
        let calcHeight = (popupImage.image?.size.height)! / ratio
        popupImageHeight.constant = calcHeight
        
        print("image.size: \(popupImage.image!.size.width)") //실제 이미지
        print("image.frame: \(popupImage.frame.size.width)") //현재 담고 있는 frame
        print("ratio: \(ratio)") //1.59
    }
    
    
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    
}

