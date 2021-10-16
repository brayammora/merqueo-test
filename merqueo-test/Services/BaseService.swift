//
//  BaseService.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias - Ceiba Software on 16/10/21.
//

import Foundation
import Combine

protocol BaseService {
    func sendRequest<T: Codable>(url: String, of: T.Type, method: HTTPMethod)  -> AnyPublisher<T, Error>
}

extension BaseService {
    
    func sendRequest<T: Codable>(url: String, of: T.Type, method: HTTPMethod)  -> AnyPublisher<T, Error> {
        guard let url = URL(string: url) else {
            return Result.Publisher(CustomError.badUrl).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.name
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                        response.statusCode == 200
                else {
                    throw CustomError.responseError
                }
                
                return $0.data
            }
            .receive(on: RunLoop.main)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
