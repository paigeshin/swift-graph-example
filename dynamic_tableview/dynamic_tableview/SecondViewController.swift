//
//  SecondViewController.swift
//  dynamic_tableview
//
//  Created by shin seunghyun on 2020/03/17.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import UIKit

//Second Practice, Email App
class SecondViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var emailData:[String] = ["hello", "bonjour", "guten tag", "Vestibulum mollis ornare arcu eu placerat. Nulla sit amet dictum elit, ac tristique odio. Integer quis quam auctor, gravida felis a, pharetra ipsum. Donec ultricies tortor suscipit mauris sagittis faucibus. Nunc laoreet, mauris ac congue pharetra, ex dui efficitur est, eget feugiat mauris ligula eu arcu. Nunc maximus elementum nisi, at consequat risus maximus vitae. Mauris fringilla ornare dolor, eu vulputate nibh gravida eu. Nunc sit amet metus sed lorem sollicitudin pulvinar rhoncus nec nulla. Quisque id vehicula felis. Mauris mattis neque a magna laoreet, sit amet ullamcorper mi malesuada. Fusce dictum arcu id pellentesque tempus. Maecenas nec interdum enim. Aliquam vel egestas est. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension

    }
    

}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return emailData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: EmailCell = tableView.dequeueReusableCell(withIdentifier: "EmailCell", for: indexPath) as! EmailCell
        cell.content.text = emailData[indexPath.row]
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

class EmailCell: UITableViewCell {
    
    @IBOutlet weak var contentTitle: UILabel!
    @IBOutlet weak var cell2: UILabel!
    @IBOutlet weak var cell3: UILabel!
    @IBOutlet weak var content: UILabel!
    
}
