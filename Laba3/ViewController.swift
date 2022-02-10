//
//  ViewController.swift
//  Laba3
//
//  Created by Илья Волынец on 23.11.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.attributedPlaceholder = NSAttributedString(
            string: "логин",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "пароль",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "3.jpeg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
            self.view.insertSubview(backgroundImage, at: 0)
        
    }
        
        @IBAction func logInButton(_ sender: UIButton) {
            var countLogin = 0
            var checkLogin = false
            if let password = passwordTextField.text,
                let login = loginTextField.text {
                for element in LoginManager.shared.getUserInformation(){
                   if element.login == login && element.password == password{
                    LoginManager.shared.arrayOfView.append(true)
                    LoginManager.shared.setView(array : LoginManager.shared.arrayOfView)
                    LoginManager.shared.arrayOfLogin.append(countLogin)
                    LoginManager.shared.setLogin(array: LoginManager.shared.arrayOfLogin)
                    preview(identifier: "SecondView")
                    checkLogin = true
                    clearTextField ()
                    break
                }else{
                    countLogin += 1
                    }
                }
            }
            if checkLogin == false {
                printAlert(titleAlert: "Ошибка", messageAlert: "Неправильный логин или пароль")
            }
        }
        
        @IBAction func saveButton(_ sender: UIButton) {
            var saveLogin = true
            if passwordTextField.text! == "" || loginTextField.text! == ""{
                printAlert(titleAlert: "Ошибка", messageAlert: "Поля не заполненны")
            }else{
                if let password = passwordTextField.text, let login = loginTextField.text {
                for element in LoginManager.shared.getUserInformation(){
                    if element.login == login{
                        printAlert(titleAlert: "Ошибка", messageAlert: "Такой логин уже существует")
                        saveLogin = false
                    }
                }
                    if saveLogin{
                       clearTextField ()
                        printAlert(titleAlert: "Поздравляю!", messageAlert: "Вы удачно зарегестрировались")
                        LoginManager.shared.arrayOfUser.append(UserInformation(login: login, password: password))
                        LoginManager.shared.setUserInformation(array: LoginManager.shared.arrayOfUser)
                    }
                }
            }
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }
        
    }

    private extension ViewController{
        
        func printAlert (titleAlert : String , messageAlert : String) {
            let alert = UIAlertController(title: titleAlert, message: messageAlert, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Оk", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        func clearTextField () {
            passwordTextField.text = ""
            loginTextField.text = ""
        }
        
        func preview (identifier : String){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: identifier)
            self.present(controller, animated: true, completion: nil)
        }
        
    }

    extension ViewController : UITextFieldDelegate{
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            passwordTextField.resignFirstResponder()
            loginTextField.resignFirstResponder()
            return true
        }
    }

