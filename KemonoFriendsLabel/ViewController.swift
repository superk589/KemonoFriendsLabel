//
//  ViewController.swift
//  KemonoFriendsLabel
//
//  Created by zzk on 2017/4/7.
//  Copyright © 2017年 zzk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var centerLabel: KemonoFriendsLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = KemonoFriendsLabel()
        label.text = "兽娘动物园"
        label.font = UIFont.systemFont(ofSize: 40, weight: 30)
        label.sizeToFit()
        view.addSubview(label)
        label.frame.origin.y = centerLabel.frame.minY - 18.5 - label.frame.height
        label.center.x = view.center.x
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

