//
//  ViewController.swift
//  DatePicker
//
//  Created by Nam on 2024/06/27.
//

import UIKit

class DateViewController: UIViewController {

    let timeSelector: Selector = #selector(DateViewController.updateTime)   // 타이머가 구동되면 실행하는 함수
    let interval = 1.0  // 타이머 간격 (1초)
    var count = 0   // 타이머 간격 확인
    var alarmTime = ""
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        // 각 인자둘은 - 타이머간격 / 동작될 view / 타이머가 구동될 때 실행할 함수 / 사용자 정보 / 반복여부 를 나타냄
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender // 전달된 인수 저장
        
        let formatter = DateFormatter() // DateFormatter 클래스 상수 선언
        
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"

        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date) // 선택한 날짜를 형식에 맞게 문자열로 변환
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
        
    }
    
    @objc func updateTime(){ // objective C와의 호환성을 위해 @objc를 추가

        
        let date = NSDate() // 현재 시간을 가져옴
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(for: date)
        
        if(alarmTime == currentTime) {
            view.backgroundColor = UIColor.red
        }
        else{
            view.backgroundColor = UIColor.white
           
        }
        
    }
}

