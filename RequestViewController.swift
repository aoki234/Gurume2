//
//  RequestViewController.swift
//  
//
//  Created by aokijun on 2018/08/31.
//

import UIKit
//import Firebase

class RequestViewController: UIViewController,UITextFieldDelegate {

   
    @IBOutlet weak var priceTextfield: UITextField!
    
    
    @IBOutlet weak var locationTextfield: UITextField!
    
    @IBOutlet weak var foodTextField: UITextField!
    
    
    @IBOutlet weak var reqButton: UIButton!
    
    @IBOutlet weak var cancelBUtton: UIButton!
    
    
    var travelItem: TravelItem?
    
    //var ref: DatabaseReference!
    
    /*func setupFirebase() {
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
 }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceTextfield.delegate = self
        locationTextfield.delegate = self
        foodTextField.delegate = self
        
        //var senderId = "user1"
       // var senderDisplayName = "Mike1"
        
       // setupFirebase()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let travelItem = travelItem {
            priceTextfield.text = travelItem.location
            //sDatePicker.date = travelItem.start!
           locationTextfield.text = travelItem.end!
            foodTextField.text = travelItem.notes
        } else {
            priceTextfield.text = ""
        }
    }
    
    
    
    @IBAction func registerbtn(_ sender: Any) {
        /*if let price = priceTextfield.text, let location = locationTextfield.text, let food = foodTextField.text {
            let post1 = ["from": location, "name": food, "text":price]
            let post1Ref = ref.childByAutoId()
            post1Ref.setValue(post1)
            */
        if travelItem == nil {
            travelItem = CoreDataHelper.newTravelItem()
            
            travelItem?.location = locationTextfield.text ?? ""
            //travelItem?.start = startDatePicker.date
            travelItem?.end = priceTextfield.text
            travelItem?.notes = foodTextField.text
            
            CoreDataHelper.save()
            
            let alert: UIAlertController = UIAlertController(title: "Registered your request", message: "Please confirm", preferredStyle:  UIAlertControllerStyle.alert)
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                print("OK")
                
                let storyboard: UIStoryboard = self.storyboard!
                //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
                let second = storyboard.instantiateViewController(withIdentifier: "selectView")
                //ここが実際に移動するコードとなります
                self.present(second, animated: true, completion: nil)
            })
            
            
            // ③ UIAlertControllerにActionを追加
            alert.addAction(defaultAction)
            
            // ④ Alertを表示
            present(alert, animated: true, completion: nil)
        
        } else if travelItem != nil {
            travelItem?.location = locationTextfield.text ?? ""
            //travelItem?.start = startDatePicker.date
            travelItem?.end = priceTextfield.text
            travelItem?.notes = foodTextField.text
            
            CoreDataHelper.save()
            
            
            let alert: UIAlertController = UIAlertController(title: "Registered your request", message: "Please confirm", preferredStyle:  UIAlertControllerStyle.alert)
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                print("OK")
                
                let storyboard: UIStoryboard = self.storyboard!
                //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
                let second = storyboard.instantiateViewController(withIdentifier: "selectView")
                //ここが実際に移動するコードとなります
                self.present(second, animated: true, completion: nil)
            })
           
            
            // ③ UIAlertControllerにActionを追加
            alert.addAction(defaultAction)
            
            // ④ Alertを表示
            present(alert, animated: true, completion: nil)
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
