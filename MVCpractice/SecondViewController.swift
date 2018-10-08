//
//  SecondViewController.swift
//  MVCpractice
//
//  Created by user on 2018/10/08.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,SecondViewDelegate {
    func push(text: String) {
        
        mModel.text = text
        
    }
    

    private var mModel = secondModel(text: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let aa = secondView(frame: view.frame)
        self.view = aa
        aa.delegate = self  //これを忘れてめちゃくちゃ苦労したの巻
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    

   

}
