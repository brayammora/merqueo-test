//
//  HTTPMethod.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 16/10/21.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    
    var name: String {
        return rawValue
    }
}
