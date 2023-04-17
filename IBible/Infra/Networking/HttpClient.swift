//
//  HttpClient.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 17/04/23.
//

import Foundation

class HttpClient {
    static let shared:HttpClient = HttpClient()
    private static var token: String? = nil
    
    private static let config: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = [
            "Authorization": "Bearer \(token ?? "")",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        return config
    }()
    
    let session = URLSession(configuration: config)
    let basePath = "https://www.abibliadigital.com.br/api"

    
    private init() {}
    
    static func setToken(token: String) {
        self.token = token
    }
}
