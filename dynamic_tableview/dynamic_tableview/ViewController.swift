//
//  ViewController.swift
//  dynamic_tableview
//
//  Created by shin seunghyun on 2020/03/17.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var textDataArray: [String] = ["Lorem ipsum dolor sit amet", "consectetur adipiscing elit", "Curabitur elementum metus luctus",
                                   
                                   "...",
                                   "...",
                                   "..."
    ]
    
    //크기의 값을 담을 어레이
    var heightArray: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension //자동으로 길어진 view에 따라서 tableView Cell의 높이 값을 바꿔줌.
        
        for _ in 0...textDataArray.count {
            heightArray.add(false)
        }
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MyCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.myLabel.text = textDataArray[indexPath.row]
        
        if !(heightArray[indexPath.row] as! Bool) {
            cell.myLabel.numberOfLines = 1
        }
        else {
            cell.myLabel.numberOfLines = 0
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if heightArray[indexPath.row] as! Bool {
            heightArray.replaceObject(at: indexPath.row, with: false)
        }
        else {
            heightArray.replaceObject(at: indexPath.row, with: true)
        }
        
        tableView.reloadRows(at: [indexPath] , with: .automatic)
        
    }
    
}

class MyCell: UITableViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    
}
