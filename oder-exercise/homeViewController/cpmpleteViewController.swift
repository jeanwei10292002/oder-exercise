//
//  cpmpleteViewController.swift
//  oder-exercise
//
//  Created by jeanwei on 2020/7/18.
//  Copyright © 2020 jeanwei. All rights reserved.
//

import UIKit

class cpmpleteViewController: UIViewController {
    var closure  : ((String)->())!
       var myDrink : drink!
    @IBOutlet var orderLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

      orderLabel.text = String(format:"您的飲料：%@\n甜度為：%@\n冰量為：%@\n售價：%d",myDrink.name, myDrink.sweetness, myDrink.ice, myDrink.price)
    }

    @IBAction func backToHomePage(_ sender: Any) {
        closure("您的點餐已送出\n請點選開始點餐進行下一次點餐作業")
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
