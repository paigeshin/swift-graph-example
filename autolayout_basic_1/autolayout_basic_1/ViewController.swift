//
//  ViewController.swift
//  autolayout_basic_1
//
//  Created by shin seunghyun on 2020/03/15.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var graph1Height: NSLayoutConstraint!
    @IBOutlet weak var graph2Height: NSLayoutConstraint!
    @IBOutlet weak var graph3Height: NSLayoutConstraint!
    @IBOutlet weak var graph4Height: NSLayoutConstraint!
    @IBOutlet weak var graph5Height: NSLayoutConstraint!
    @IBOutlet weak var graph6Height: NSLayoutConstraint!
    @IBOutlet weak var graph7Height: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    
    @IBAction func changeValueFirst(_ sender: UIButton) {
        graph1Height = graph1Height.changeMultiplier(newValue: 0.7)
        graph2Height = graph2Height.changeMultiplier(newValue: 0.6)
        graph3Height = graph3Height.changeMultiplier(newValue: 0.5)
        graph4Height = graph4Height.changeMultiplier(newValue: 0.4)
        graph5Height = graph5Height.changeMultiplier(newValue: 0.3)
        graph6Height = graph6Height.changeMultiplier(newValue: 0.2)
        graph7Height = graph7Height.changeMultiplier(newValue: 0.1)
        
        //Animation 적용
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    @IBAction func changeValueSecond(_ sender: UIButton) {
        graph1Height = graph1Height.changeMultiplier(newValue: 0.1)
        graph2Height = graph2Height.changeMultiplier(newValue: 0.2)
        graph3Height = graph3Height.changeMultiplier(newValue: 0.3)
        graph4Height = graph4Height.changeMultiplier(newValue: 0.4)
        graph5Height = graph5Height.changeMultiplier(newValue: 0.5)
        graph6Height = graph6Height.changeMultiplier(newValue: 0.6)
        graph7Height = graph7Height.changeMultiplier(newValue: 0.7)
        
        //Animation 적용
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
    }
    
}


extension NSLayoutConstraint {
    
    //Policy상 Multiplier에 직접 값을 지정할 수 없기때문에, extension으로 새로운 method를 만들어 준다.
    func changeMultiplier(newValue multiplier: CGFloat) -> NSLayoutConstraint {
        //deactivate
        NSLayoutConstraint.deactivate([self])
        //새 값 지정
        let newConstraint: NSLayoutConstraint = NSLayoutConstraint(
            item: self.firstItem as AnyObject,
            attribute: self.firstAttribute,
            relatedBy: self.relation,
            toItem: self.secondItem,
            attribute: self.secondAttribute,
            multiplier: multiplier,
            constant: self.constant)
        //기본 세팅
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        //activate
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
    
}
