//
//  FirstView.swift
//  MVCpractice
//
//  Created by user on 2018/09/27.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import Foundation
import UIKit

protocol FirstViewDelegate:class { //classをつけるのはweakが付いているからでした
    
    func touch(text:String)
    func take()
}

// プロトコルでクラス間を繋げるのはクリーンアーキテクチャなのではないか


class FirstView: UIView{
    
    
    var label:UILabel!
    var textField: UITextField!
    var button:UIButton!
    var takeButton:UIButton!
    
    weak var delegate:FirstViewDelegate?
    
    required override init(frame:CGRect){// ここの引数をモデルにしている例も見た
        super.init(frame:frame)
        label = UILabel()
        label.backgroundColor = UIColor.red
        addSubview(label)
        
        textField = UITextField()
        textField.backgroundColor = UIColor.gray
        addSubview(textField)
        
        button = UIButton()
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(touch), for: .touchUpInside)
        addSubview(button)
        
        takeButton = UIButton()
        takeButton.backgroundColor = UIColor.yellow
        takeButton.addTarget(self, action: #selector(take), for: .touchUpInside)
        addSubview(takeButton)
        
    }
    // 下のコードがさっきinitの中にないといけなかったのはなぜかわからない
    var key: FirstModel? { //インスタンスでもありプロパティでもあるという方が正しいのか
        // textを変更した時でなくkeyを変更した時に呼ばれることを忘れないようにしましょう
        didSet{
            print ("ssss")
            self.label.text = key?.text //ここはストリング型
            
        }
    }
    
    
    override func layoutSubviews() {
        // 特に問題なし
        super.layoutSubviews()// これはいるのだろうか　理由はわからんけどいります
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        textField.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        button.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        takeButton.frame = CGRect(x: 0, y: 200, width: 100, height: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {//これは一体なんでしょう
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func touch(){
        print (self.textField.text!)
        delegate?.touch(text:self.textField.text!)
        // この辺のセレクタの処理はVCに書くという意見もある
        
    }
    
    @objc func take(){
        delegate?.take()
        
    }
    
    
}
