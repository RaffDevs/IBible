//
//  LoginDefaults.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 18/04/23.
//

import Foundation

class LoginDefaults {
    private let defaults: UserDefaults = UserDefaultsConfig.shared.defaults
    
    var token: String {
        get {
            return defaults.string(forKey: "token") ?? ""
        }
        set {
            defaults.set(newValue, forKey: "token")
        }
    }
    
}
