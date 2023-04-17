//
//  Errors.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 17/04/23.
//

import Foundation

enum ApiErrors: Error {
    case invalidURL(message: String)
    case invalidResponse(message: String)
    
    var message: String {
        switch self {
        case .invalidURL(message: "Url inválida!"):
            return self.message
        case .invalidResponse(message: "O servidor enviou uma resposta inesperada"):
            return self.message
        default:
            return "Erro desconhecido!"
        }
    }
}
