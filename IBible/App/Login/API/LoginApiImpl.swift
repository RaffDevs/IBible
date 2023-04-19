//
//  LoginAPIImpl.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 18/04/23.
//

import Foundation

class LoginApiImpl: LoginApiProtocol {
    private let client: HttpClient = HttpClient.shared
    
    func createUser(user: CreateUserDTO, completion: @escaping (Result<UserEntity, Error>) -> Void) {
        guard var url = URL(string: client.basePath) else {
            print("URL inválida!")
            return
        }
        
        guard let body = try? JSONEncoder().encode(user) else {
            print("Erro ao fazer parse dos dados!")
            return
        }
        
        url.append(path: "/users")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        
        
        print(user)
        
        let task = client.session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print("Erro ao fazer requisição \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print(#function)
                let res = response as!HTTPURLResponse
                print("Resposta inválida do servidor \(res.statusCode)")
                return
            }
            
            guard let data = data else {
                print("Nenhum dado retornado")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(UserEntity.self, from: data)
                completion(.success(result))
            } catch let error {
                completion(.failure(error))
                print("Erro ao analisar a resposta: \(error)")
            }
        }
        
        task.resume()
    }
    
    func getUser(email: GetUserDTO, completion: @escaping (Result<UserEntity, Error>) -> Void) {
        guard var url = URL(string: client.basePath) else {
            print("URL inválida!")
            return
        }
        url.append(path: "/users")
        url.append(path: "/\(email.email)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = client.session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print("Erro ao fazer requisição \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                let res = response as!HTTPURLResponse
                print("Resposta inválida do servidor \(res.statusCode)")
                return
            }
            
            guard let data = data else {
                print("Nenhum dado do servidor!")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(UserEntity.self, from: data)
                completion(.success(result))
            } catch let error {
                completion(.failure(error))
                print("Erro ao analisar a resposta: \(error)")
            }
        }
        
        task.resume()
    }
}
