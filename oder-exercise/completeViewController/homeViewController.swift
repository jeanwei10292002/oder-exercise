//
//  homeViewController.swift
//  oder-exercise
//
//  Created by jeanwei on 2020/7/18.
//  Copyright © 2020 jeanwei. All rights reserved.
//

import UIKit

class drink : NSObject{
    var name : String = ""
    var sweetness : String = ""
    var sweetSelectIndex : Int = 0
    var ice : String = ""
    var iceSelectIndex : Int = 0
    var price : Int = 0
}

class homeViewController: UIViewController {
    
   

    @IBOutlet var startBtn: UIButton!
    @IBOutlet var showOrderLabel: UILabel!
    @IBOutlet var completeBtn: UIBarButtonItem!
    //新增一個飲料物件
    var myDrink : drink!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //設定第一次點餐時顯示的提示
        //Label顯示文字
        showOrderLabel.text = "您尚未點餐\n請點選開始點餐進行點餐作業 "

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(myDrink != nil){
            startBtn.setTitle("修改訂單", for: .normal)
            showOrderLabel.text =  String(format:"您的飲料：%@\n甜度為：%@\n冰量為：%@\n售價：%d",myDrink.name, myDrink.sweetness, myDrink.ice, myDrink.price)
           print("\(myDrink.price) is  years old .")
            completeBtn.isEnabled = true
        }
        else{
            startBtn.setTitle("開始點餐", for: .normal)
            completeBtn.isEnabled = false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "OrderSegue"){
            let VC = segue.destination as! oderViewController
            VC.myDrink = myDrink
            VC.delegate = self
            
        }
    }
   
    
    @IBAction func completeViewBtnClick(_ sender: Any) {
       let VC = cpmpleteViewController()
            VC.myDrink = myDrink
            VC.closure  = { (msg:String)->() in
                self.myDrink = nil
                self.showOrderLabel.text = msg
                self.startBtn.setTitle("開始點餐", for: .normal)
                self.completeBtn.isEnabled = false
            }
            present(VC, animated: true, completion: nil)
        }
    }
    
   
    extension homeViewController : OrderViewDelegate{
          func sendOrder(myOrder: drink) {
              myDrink = myOrder
          }
}

    


