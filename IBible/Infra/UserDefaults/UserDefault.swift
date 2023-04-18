//
//  UserDefault.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 18/04/23.
//

import Foundation

class UserDefaultsConfig {
    static var shared: UserDefaultsConfig = UserDefaultsConfig()
    let defaults = UserDefaults.standard
    
    private init() {}
}
