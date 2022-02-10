//
//  LoginManager.swift
//  Laba3
//
//  Created by Илья Волынец on 23.11.21.
//

import UIKit
import Foundation

class LoginManager {
    
    static let shared = LoginManager()
    private init(){}
    
    var arrayOfUser = [UserInformation]()
    var arrayOfView = [Bool]()
    var arrayOfLogin = [Int]()
    let key = "text"
    let secondKey = "view"
    let thirdKey = "login"
    
    func setLogin(array:  [Int]){
        UserDefaults.standard.set(array, forKey: thirdKey)
        UserDefaults.standard.synchronize()
    }
    
    func getLogin() -> [Int]{
        if let array = UserDefaults.standard.array(forKey: thirdKey) as? [Int] {
            return array
        }else{
            return []
        }
    }
    
    func setView(array :  [Bool]){
        UserDefaults.standard.set(array, forKey: secondKey)
        UserDefaults.standard.synchronize()
    }
    
    func getView() -> [Bool]{
        if let arrayOfView = UserDefaults.standard.array(forKey: secondKey) as? [Bool] {
            return arrayOfView
        }else{
            return []
        }
    }
    
    func setUserInformation( array :  [UserInformation]){
        let arrayOfUser = NSKeyedArchiver.archivedData(withRootObject: array)
        UserDefaults.standard.set(arrayOfUser, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func getUserInformation() -> [UserInformation]{
        if let array = UserDefaults.standard.data(forKey: key),
            let arrayOfUser = NSKeyedUnarchiver.unarchiveObject(with: array) as? [UserInformation] {
             return arrayOfUser
            } else {
                return []
            }
    }
}
