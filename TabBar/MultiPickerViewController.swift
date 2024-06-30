//
//  ViewController.swift
//  MultiPickerView
//
//  Created by Nam on 2024/06/27.
//

import UIKit

class MultiPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let MAX_ARRAY_NUM = 5
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT: CGFloat = 80
    var leftImageArr = [UIImage?]()
    var rightImageArr = [UIImage?]()
    var leftImageFile = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg"]
    var rightImageFile = ["6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"]

    
    @IBOutlet var leftPickerView: UIPickerView!
    @IBOutlet var rightPickerView: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< MAX_ARRAY_NUM {  // 배열에 이미지 할당
            let image = UIImage(named: leftImageFile[i])
            leftImageArr.append(image)
        }
        for i in 0 ..< MAX_ARRAY_NUM {  // 배열에 이미지 할당
            let image = UIImage(named: rightImageFile[i])
            rightImageArr.append(image)
        }
        lblImageFileName.text = leftImageFile[0]
        imgView.image = leftImageArr[0]
        
    }
    // 피커 뷰 열 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    // 피커 뷰 높이
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    // 어떤 피커 뷰를 표기할지 결정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == leftPickerView){ // 조건문을 통해 leftPickerView와 rightPickerView 를 구분한다
            return leftImageFile.count
        } else{
            return rightImageFile.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if(pickerView == leftPickerView){
            let imgView = UIImageView(image: leftImageArr[row])
            imgView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
            return imgView
        } else{
            let imgView = UIImageView(image: rightImageArr[row])
            imgView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
            return imgView
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == leftPickerView){
            lblImageFileName.text = leftImageFile[row]
            imgView.image = leftImageArr[row]
        } else{
            lblImageFileName.text = rightImageFile[row]
            imgView.image = rightImageArr[row]
        }
    }
    
}

