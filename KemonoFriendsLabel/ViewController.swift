//
//  ViewController.swift
//  KemonoFriendsLabel
//
//  Created by zzk on 2017/4/7.
//  Copyright © 2017年 zzk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = KemonoFriendsLabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0))
        label.numberOfLines = 0
        label.text = "Multi-lines\nis also supported"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40, weight: 30)
        label.sizeToFit()
        view.addSubview(label)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

