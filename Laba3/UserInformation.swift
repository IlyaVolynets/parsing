//
//  UserInformation.swift
//  Laba3
//
//  Created by Илья Волынец on 23.11.21.
//

import Foundation

class UserInformation : NSObject, NSCoding {
    
    var login : String
    var password : String
   
    init(login: String, password : String ) {
        
        self.login = login
        self.password = password
        
    }
    
    required init(coder decoder: NSCoder) {
        self.login = decoder.decodeObject(forKey: "login") as? String ?? ""
        self.password = decoder.decodeObject(forKey: "password") as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(login, forKey: "login")
        coder.encode(password, forKey: "password")
    }
}
