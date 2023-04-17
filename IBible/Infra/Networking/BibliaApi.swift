//
//  BibliaApi.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 17/04/23.
//

import Foundation


class BibliaApi {
    private let httpClient = HttpClient.shared
    
    func createUser(user: CreateUserDTO, completion: @escaping (Result<UserEntity, Error>) -> Void) {
        guard var url = URL(string: httpClient.basePath) else {
            print("URL inválida!")
            return
        }
        url.append(path: "/users")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let task = httpClient.session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print("Erro ao fazer requisição \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Resposta inválida do servidor")
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
    
    func getUser(user: GetUserDTO, completion: @escaping (Result<UserEntity, Error>) -> Void) {
        guard var url = URL(string: httpClient.basePath) else {
            print("URL inválida!")
            return
        }
        url.append(path: "/users")
        url.append(path: "/\(user.email)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = httpClient.session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print("Erro ao fazer requisição \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Resposta inválida do servidor")
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