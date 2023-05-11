//
//  ViewController.swift
//  ThreadTest
//
//  Created by 이서영 on 2023/05/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var CurrentTimer: UILabel!
    
    @IBOutlet weak var SettingTime: UILabel!
    var alarmTime : String = ""
    var count = 0
    
    @IBAction func didTapBtn(_ sender: Any) {
        
        guard let vc = self.storyboard?.instantiateViewController(identifier: "TempViewController") as? TempViewController else { return }
            
        
        self.present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // 1초마다 updateTime 함수를 실행시키는 타이머
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    @objc func updateTime(){
        
        //date에게 NSDate() 라는 클래스를 선언
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        
        CurrentTimer.text = "현재시간 : \(formatter.string(from: date as Date))"
        
        //알림부분
        formatter.dateFormat = "hh:mm"
        let currentTime = formatter.string(from: date as Date)
        
        if alarmTime == currentTime{
            count += 1
            if count % 2 == 1 {
                view.backgroundColor = UIColor.yellow
            }else {
                view.backgroundColor = UIColor.red
            }
        }else{
            view.backgroundColor = UIColor.white
        }
        
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        let datePickerView = sender // datePickerView 선택한 값 저장!
        let formatter = DateFormatter() //날짜를 표시할 형식으로
        formatter.dateFormat = "hh:mm"
        
        SettingTime.text = "설정시간 : \(formatter.string(from: datePickerView.date))"
        
        // 알람부분
        formatter.dateFormat = "hh:mm"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    

}

