//
//  FirstModel.swift
//  MVCpractice
//
//  Created by user on 2018/09/27.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import Foundation
struct FirstModel {
   // MはSwiftyJSONに任せるだけなんてことも
    var text: String!
    
    func save(text:String){
        
        UserDefaults.standard.set(text, forKey: "text")
    
    }
    
    func take(forKey:String) -> FirstModel {
        
        // 返すべきはテキストの値ではなくたくさんあるインスタンスのうちのどれを返すかということ
        return UserDefaults.standard.object(forKey: forKey) as! FirstModel
    }
    
    
}
