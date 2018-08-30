//
//  RequestViewController.swift
//  
//
//  Created by aokijun on 2018/08/31.
//

import UIKit
import Firebase

class RequestViewController: UIViewController,UITextFieldDelegate {

   
    @IBOutlet weak var priceTextfield: UITextField!
    
    
    @IBOutlet weak var locationTextfield: UITextField!
    
    @IBOutlet weak var foodTextField: UITextField!
    
    
    @IBOutlet weak var reqButton: UIButton!
    
    @IBOutlet weak var cancelBUtton: UIButton!
    
    
    var ref: DatabaseReference!
    
    func setupFirebase() {
        // DatabaseReferenceのインスタンス化
        ref = Database.database().reference()
        
        // 最新25件のデータをデータベースから取得する
        // 最新のデータが追加されるたびに最新データを取得する
        ref.child("gurumeproject").queryLimited(toLast: 25).observe(DataEventType.childAdded, with: { (snapshot) -> Void in
            let snapshotValue = snapshot.value as! NSDictionary
            let text = snapshotValue["text"] as! String
            let sender = snapshotValue["from"] as! String
            let name = snapshotValue["name"] as! String
            print(snapshot.value!)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceTextfield.delegate = self
        locationTextfield.delegate = self
        foodTextField.delegate = self
        
        var senderId = "user1"
        var senderDisplayName = "Mike1"
        
        setupFirebase()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerbtn(_ sender: Any) {
        if let price = priceTextfield.text, let location = locationTextfield.text, let food = foodTextField.text {
            let post1 = ["from": location, "name": food, "text":price]
            let post1Ref = ref.childByAutoId()
            post1Ref.setValue(post1)
            
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

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        priceTextfield.resignFirstResponder()
        locationTextfield.resignFirstResponder()
        foodTextField.resignFirstResponder()
        return true
    }
    
}
