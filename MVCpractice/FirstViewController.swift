//
//  ViewController.swift
//  MVCpractice
//
//  Created by user on 2018/09/27.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,FirstViewDelegate {// クラス一つとプロトコル１つなら継承できるのか
    
    
    // 一つのクラスに一つのモデルというのが正しい書き方らしい
    private let mModel = FirstModel()
    func touch(text:String) {
        
        print (text)
        var instance2 = FirstModel()
        instance2.save(text:text)
        
        
    }
    
    func take(){
        
        var instance4 = FirstModel()
        var labeltext = FirstView()
        labeltext.key = instance4.take(forKey:"text")
        
        //左がkeyで右がストリングなのがエラーの原因
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let aa = FirstView(frame: self.view.frame)
//        // Do any additional setup after loading the view, typically from a nib.
//        view.addSubview(aa)
        
        self.view =  FirstView(frame: self.view.frame)//が正しい書き方らしい
        FirstView(frame: self.view.frame).delegate = self  // これがあって初めて上のtouchが呼び出される
    }


}

