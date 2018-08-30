//
//  RecommendViewController.swift
//  Myloginapp
//
//  Created by 安住洋平 on 2018/08/28.
//  Copyright © 2018年 aokijun. All rights reserved.
//

import UIKit

class RecommendViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var TableTitle = [ ["Name", "UserName", "NickName"],
                       ["address", "email", "passward"],
                       
                       ["Detail", "Sex", "Birthday"],
                       ["location", "habitant"]
    ]
    
    
    var TableSubtitle = [ ["", "aoki234", "kessyobanchan"],
                          ["","yonezawa_hack@yamagata.gmail.com", "Yoshitune"],
                          ["", "Man", "2011/03/11"],
                          ["", "Sendai"]
    ]
    
    
    
        @IBOutlet weak var tableView: UITableView!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
        }
        
        
        override var prefersStatusBarHidden: Bool {
            return true
        }
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return TableTitle.count
        }
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return TableTitle[section].count - 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "ReTanbleViewCell")
            cell.textLabel?.text = TableTitle[indexPath.section][indexPath.row + 1]
            cell.detailTextLabel?.text = TableSubtitle[indexPath.section][indexPath.row + 1]
            return cell
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return TableTitle[section][0]
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        }
}
