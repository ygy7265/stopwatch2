//
//  ViewController.swift
//  stopwatch2
//
//  Created by D7703_19 on 2019. 4. 16..
//  Copyright © 2019년 sin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timelabel: UILabel!
    var counter = 0
    var myTimer = Timer()
    var timer_running = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnstart(_ sender: Any) {
        if timer_running {
            //세번째 인자 사용(후행클로저)
            myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){//withTimeInterval: 1(초)
                (timer: Timer) -> Void in
                self.counter+=1 // 시간증가
                self.timelabel.text = String(self.counter)
            }
            timer_running = false //중복시작안되게 false로바꿔줌.
        }
    }
    
    
    @IBAction func btnpause(_ sender: Any) {
        myTimer.invalidate()
        timer_running = true //다시 Start버튼누를수있게 true로바꿔줌
    }
    
    @IBAction func bthstop(_ sender: Any) {
        myTimer.invalidate()
        counter = 0
        timelabel.text = String(counter)
        timer_running = true //다시 Start버튼누를수있게 true로바꿔줌
    }
    

}

