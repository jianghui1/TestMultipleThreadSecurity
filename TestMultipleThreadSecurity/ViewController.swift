//
//  ViewController.swift
//  TestMultipleThreadSecurity
//
//  Created by ys on 16/2/28.
//  Copyright © 2016年 jzh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1、打印当前线程
        print("\(self).thread == \(NSThread.currentThread())")
        
        // 2、本线程设置定时器
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timerAction", userInfo: nil, repeats: true)
        
        // 3、开启子线程设置定时器
        self.performSelectorInBackground("backAction", withObject: nil)
    }
    
    func timerAction() {
        print("这是\(self)本线程的行为\(NSDate())")
    }
    
    func backAction() {
        print("\(self).backThread == \(NSThread.currentThread())")
        print("后台任务")
    }
}

