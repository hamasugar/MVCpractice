//
//  secondModel.swift
//  MVCpractice
//
//  Created by user on 2018/10/08.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import Foundation
// 寿司クラスとか言ってたのはこれのことなのか
struct secondModel{
    
    var text:String{
        
        didSet{
            UserDefaults.standard.set(text, forKey: "text")
            secondView.reloadData()
            print ("jjjj")
        }
        
        
    }//ここにDidsetを書いたらダメなのかオッケーでした　ここで通知をするのもありですね　非同期処理に強そう
    
}
