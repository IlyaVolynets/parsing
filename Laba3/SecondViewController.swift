//
//  SecondViewController.swift
//  Laba3
//
//  Created by Илья Волынец on 23.11.21.
//

import UIKit
import Foundation


class SecondViewController: UIViewController {
    
    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var moodPickerView: UIPickerView!
    @IBOutlet weak var moodImage: UIImageView!
    
    @IBOutlet weak var moodLabel: UILabel!
    var arrayOfMood = ["Спокойным","Веселым","Влюбленным","Злым","В шоке","Уставшим"]
    var recomendationArray = ["Это говорит о том, что вы знаете себя. В зависимости от этого вы можете стараться преодолеть это состояние или, наоборот, наслаждаться этим состоянием и оставаться тихим и спокойным.","Живите и радуйтесь жизни, пообщайтесь с друзьями, сходите на прогулку, это самое подходящее для этого состояние", "Любовь – прекрасное чувство. Оно часто оказывается коварным и заставляя совершать неадекватные поступки. Старайтесь оставаться в спокойствие и здравом уме" ,"Глубоко дышите, сходите в спортзал,в случае назревающего конфликта, когда эмоции зашкаливают, взять паузу и съесть что-то сладкое, успокоиться.", "Постарайтесь успокоиться, переключить внимание на что-то другое, позвоните другу и попросите его поговорить с вами на разные темы, пообщайтесь с семьей", "Самое время пойти отдохнуть, прилечь поспать или хотя бы просто полежать, постараться ни о чем не думать. Также хороший вариант посмотреть фильм"]
    
   // var loginName = LoginManager.shared.getText()[hff]
    override func viewDidLoad() {
        if let loginIndex = LoginManager.shared.getLogin().last {
        let loginName = LoginManager.shared.getUserInformation()[loginIndex]
        super.viewDidLoad()
        loginLabel.text = "Привет, " + loginName.login + "!"
        }
    }
    @IBAction func logInButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MainView")
        self.present(controller, animated: true, completion: nil)
        LoginManager.shared.arrayOfView.removeAll()
        LoginManager.shared.setView(array : LoginManager.shared.arrayOfView)
        LoginManager.shared.arrayOfLogin.removeAll()
        LoginManager.shared.setLogin(array : LoginManager.shared.arrayOfLogin)
    }
}



extension SecondViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView , numberOfRowsInComponent component: Int) -> Int {

        return arrayOfMood.count
    }
    

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  arrayOfMood[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        if row == 0{
            moodImage.image = UIImage(named: "11.jpeg")
            moodLabel.text = recomendationArray[0]
        }else if row == 1{
            moodImage.image = UIImage(named: "22.jpeg")
            moodLabel.text = recomendationArray[1]
        }else if row == 2{
            moodImage.image = UIImage(named: "44.jpeg")
            moodLabel.text = recomendationArray[2]
        }else if row == 3{
            moodImage.image = UIImage(named: "33.jpeg")
            moodLabel.text = recomendationArray[3]
        }else if row == 4{
            moodImage.image = UIImage(named: "66.jpeg")
            moodLabel.text = recomendationArray[4]
        }else if row == 5{
            moodImage.image = UIImage(named: "55.jpeg")
            moodLabel.text = recomendationArray[5]
       
        }
    
    }
}
