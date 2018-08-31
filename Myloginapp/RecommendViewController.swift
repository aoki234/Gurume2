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
                          ["", "Man", "1997/04/19"],
                          ["", "Sendai"]
    ]
    
    var images = ["ちょまど8.jpg","剛力彩芽7.jpg","池澤あやか4.jpg"]
    
    
    
        @IBOutlet weak var tableView: UITableView!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
            
            //let image4 = UIImage(named: "ちょまど８.jpg")
            
            
            //let image1:UIImage = UIImage(named: "ちょまど８.jpg")!
            //let image2:UIImage = UIImage(named: "剛力彩芽３.jpg")!
            //let image3:UIImage = UIImage(named: "池澤あやか3.jpg")!
            
            //var images:Array<UIImage> = []

           // images.append(image1)
           // images.append(image2)
            //images.append(image3)
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

            //cell.reimageView?.image = UIImage(named: images[indexPath.row])

            return cell
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return TableTitle[section][0]
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        }
}
