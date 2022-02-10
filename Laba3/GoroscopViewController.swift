//
//  GoroscopViewController.swift
//  Laba3
//
//  Created by Илья Волынец on 23.11.21.
//
import UIKit
import Foundation
import SwiftSoup

class GoroscopViewController: UIViewController {
    @IBOutlet weak var goroskopImageView: UIImageView!
    @IBOutlet weak var goroskopLabel: UILabel!
    @IBOutlet weak var goroscopPickerView: UIPickerView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    var arrayOfDate = ["21 марта — 19 апреля","20 апреля — 20 мая","21 мая — 20 июня",
                       "21 июня — 22 июля","23 июля — 22 августа","23 августа — 22 сентября",
                       "23 сентября — 22 октября","23 октября — 21 ноября","22 ноября — 21 декабря",
                       "22 декабря — 19 января","20 января — 18 февраля","19 февраля — 20 марта"]
    var goroscopeArray = [""]
    var whoAreYouArray = ["Овен", "Телец","Близнецы","Рак","Лев","Дева","Весы","Скорпион","Стрелец",
                          "Козерог","Водолей","Рыбы"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        selectURL(urlstr: "https://horo.mail.ru/prediction/aries/today/")
        
    }
    
    
    func selectURL(urlstr : String){
        let myUrlString = urlstr
        guard let myUrl = URL(string: myUrlString) else {return}
        
        do{
            let myHTMLString = try String(contentsOf: myUrl, encoding: .utf8)
            let htmlContent = myHTMLString
            
            do{
                let doc = try SwiftSoup.parse(htmlContent)
                do{
                    let element = try doc.select("p").array()
                    do{
                        let text = try element[0].text() + element[1].text()
                        textLabel.text = text
                        
                    }
                }
            }
        }catch let error{
            print(error)
        }
    }
}


extension GoroscopViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView , numberOfRowsInComponent component: Int) -> Int {

        return arrayOfDate.count
    }
    

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  arrayOfDate[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view as? UILabel { label = v }
        label.font = UIFont (name: "Helvetica Neue", size: 18)
        label.text =  arrayOfDate[row]
        label.textAlignment = .center
        return label
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {

        let string = "myString"
        return NSAttributedString(string: string, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        if row == 0{
            goroskopImageView.image = UIImage(named: "111.png")
            goroskopLabel.text = "Вы: " + whoAreYouArray[0]
            selectURL(urlstr: "https://horo.mail.ru/prediction/aries/today/")
        }else if row == 1{
            goroskopImageView.image = UIImage(named: "222.png")
            goroskopLabel.text = "Вы: " + whoAreYouArray[1]
            selectURL(urlstr: "https://horo.mail.ru/prediction/taurus/today/")
        }else if row == 2{
            goroskopImageView.image = UIImage(named: "333.png")
            goroskopLabel.text = "Вы: " + whoAreYouArray[2]
            selectURL(urlstr: "https://horo.mail.ru/prediction/gemini/today/")
        }else if row == 3{
            goroskopImageView.image = UIImage(named: "444.png")
            goroskopLabel.text = "Вы: " + whoAreYouArray[3]
            selectURL(urlstr: "https://horo.mail.ru/prediction/cancer/today/")
        }else if row == 4{
            goroskopImageView.image = UIImage(named: "555.png")
            goroskopLabel.text = "Вы: " + whoAreYouArray[4]
            selectURL(urlstr: "https://horo.mail.ru/prediction/leo/today/")
        }else if row == 5{
            goroskopImageView.image = UIImage(named: "666.png")
            goroskopLabel.text = "Вы: " + whoAreYouArray[5]
            selectURL(urlstr: "https://horo.mail.ru/prediction/virgo/today/")
        }else if row == 6{
            goroskopImageView.image = UIImage(named: "777.png")
            goroskopLabel.text = "Вы: " + whoAreYouArray[6]
            selectURL(urlstr: "https://horo.mail.ru/prediction/libra/today/")
        }else if row == 7{
            goroskopImageView.image = UIImage(named: "888.png")
            goroskopLabel.text = "Вы: " + whoAreYouArray[7]
            selectURL(urlstr: "https://horo.mail.ru/prediction/scorpio/today/")
        }else if row == 8{
            goroskopImageView.image = UIImage(named: "999.png")
            goroskopLabel.text = "Вы: " + whoAreYouArray[8]
            selectURL(urlstr: "https://horo.mail.ru/prediction/sagittarius/today/")
        }else if row == 9{
            goroskopImageView.image = UIImage(named: "1000.png")
            goroskopLabel.text = "Вы: " + whoAreYouArray[9]
            selectURL(urlstr: "https://horo.mail.ru/prediction/capricorn/today/")
        }else if row == 10{
            goroskopImageView.image = UIImage(named: "1111.png")
            goroskopLabel.text = "Вы: " + whoAreYouArray[10]
            selectURL(urlstr: "https://horo.mail.ru/prediction/aquarius/today/")
        }else if row == 11{
            goroskopImageView.image = UIImage(named: "2222.png")
            goroskopLabel.text = "Вы: " + whoAreYouArray[11]
            selectURL(urlstr: "https://horo.mail.ru/prediction/pisces/today/")
        }
    
    }
}
