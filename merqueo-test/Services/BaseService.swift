//
//  BaseService.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 16/10/21.
//

import Foundation

protocol BaseService {
    func sendRequest<T: Codable>(url: String, of: T.Type, method: HTTPMethod, completion: @escaping (Result<T, CustomError>) -> Void)
}

extension BaseService {
    
    func sendRequest<T: Codable>(url: String, of: T.Type, method: HTTPMethod, completion: @escaping (Result<T, CustomError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.badUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.name
        
        let task = URLSession.shared.dataTask(with: request) { (data, _, _) in
            guard let data = data else {
                completion(.failure(.responseError))
                return
            }
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
            } catch {
                print(error)
                completion(.failure(.unableToParse))
            }
        }
        task.resume()
    }
}
