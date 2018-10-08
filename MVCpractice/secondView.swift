//
//  secondView.swift
//  MVCpractice
//
//  Created by user on 2018/10/08.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import Foundation
import UIKit

protocol SecondViewDelegate: class { //classをつけるのはweakが付いているからでした
    func push(text: String)
    
}

class secondView: UIView{
    
    let textField = UITextField()
    let button = UIButton()
    static let label = UILabel()
    
    public weak var delegate: SecondViewDelegate?
    
    required override init(frame:CGRect){
        super.init(frame:frame)
        
        textField.backgroundColor = UIColor.red
        secondView.label.backgroundColor = UIColor.orange
        button.backgroundColor = UIColor.black
        
        button.setTitle("ボタン", for: .normal)
        button.addTarget(SecondViewController(), action: #selector(push), for: .touchUpInside)
        
        
        addSubview(textField)
        addSubview(button)
        addSubview(secondView.label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textField.frame = CGRect(x: frame.width/10, y: frame.height/2, width: 100, height: 30)
        secondView.label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.frame = CGRect(x: frame.width/2, y: frame.height*4/5, width: 100, height: 100)
    }
    
    @objc func push(){
        
        
        delegate?.push(text: self.textField.text!)
        print ("kkkkk")
    }
    
    class func reloadData(){
        
        if let ccc = UserDefaults.standard.object(forKey: "text"){
            print ("mmmmm")
            self.label.text = ccc as! String
        }
        
    }
    
}
