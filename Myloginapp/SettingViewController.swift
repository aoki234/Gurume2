//
//  SettingViewController.swift
//  Myloginapp
//
//  Created by aokijun on 2018/08/28.
//  Copyright © 2018年 aokijun. All rights reserved.
//

import UIKit
import Firebase

class SettingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var travelLog = [TravelItem]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    let price = ["500","800","1700"]
    
    let location = ["Yonezawa","NIkko","Toyota"]
    
    let kind = ["Chinese","Japanese","USA"]
    
    var images = ["ちょまど7.jpg","剛力彩芽7.jpg","池澤あやか4.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        travelLog = CoreDataHelper.retrieveTravelItems()
        
        
        // Do any additional setup after loading the view.
        /*
        var senderId = "user1"
        var senderDisplayName = "Mike1"
        
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        //let userID = Auth.auth().currentUser?.uid
        ref.child("gurumeproject").observe(DataEventType.childAdded, with: { (snapshot) -> Void in
            let snapshotValue = snapshot.value as! NSDictionary
            let text = snapshotValue["text"] as! String
            let sender = snapshotValue["from"] as! String
            let name = snapshotValue["name"] as! String
            print(snapshot.value!)
            print(text)
            print(name)
            print(sender)
        })
        */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return location.count
        return travelLog.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReTableViewCell", for: indexPath) as! ReTableViewCell
        
        let travelItem = travelLog[indexPath.row]
        
        //cell.priceLabel.text = price[indexPath.row]
        cell.priceLabel.text = travelItem.end
        //cell.locationLabel.text = location[indexPath.row]
        cell.locationLabel.text = travelItem.location
        //cell.foodLabel.text = kind[indexPath.row]
        cell.foodLabel.text = travelItem.notes
        
        
        
        cell.reimageView.image = UIImage(named: images[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert: UIAlertController = UIAlertController(title: "confirm recommedation", message: "Accept this request？", preferredStyle:  UIAlertControllerStyle.alert)
        
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            print("OK")
            
            let storyboard: UIStoryboard = self.storyboard!
            //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
            let second = storyboard.instantiateViewController(withIdentifier: "chatController")
            //ここが実際に移動するコードとなります
            self.present(second, animated: true, completion: nil)
        })
        // キャンセルボタン
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.cancel, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            print("Cancel")
        })
        
        // ③ UIAlertControllerにActionを追加
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        
        // ④ Alertを表示
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let travelItemToDelete = travelLog[indexPath.row]
            CoreDataHelper.delete(travelItem: travelItemToDelete)
            
            travelLog = CoreDataHelper.retrieveTravelItems()
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
