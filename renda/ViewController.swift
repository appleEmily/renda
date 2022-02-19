//
//  ViewController.swift
//  renda
//
//  Created by Emily Nozaki on 2022/01/25.
//

import UIKit
import Firebase
import FirebaseFirestore

class ViewController: UIViewController {
    
    @IBOutlet var countLabel: UILabel!
    
    @IBOutlet weak var tapButton: UIButton!
    
    var number: Int = 0
    
    let firestore = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapButton.layer.cornerRadius = 125
        
        //firestore周り
        //データを監視する
        firestore.collection("count").document("share").addSnapshotListener { snapshot, error in
            if error != nil {
                print("エラーです")
                return
            }
            let data = snapshot?.data()
            if data == nil {
                print("データがありません")
                return
            }
            //辞書型で入っている。dataの中から"count"というkeyで引っかかるものを取ってくる
            let count = data!["count"] as? Int
            if count == nil {
                print("countという対応する値がない")
                return
            }
            self.number = count!
            self.countLabel.text = String(self.number)
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        number += 1
        countLabel.text = String(number)
        firestore.collection("count").document("share").setData(["count": number])
    }
    


}

