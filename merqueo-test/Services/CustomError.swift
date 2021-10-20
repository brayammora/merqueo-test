//
//  CustomError.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 16/10/21.
//

import Foundation

enum CustomError: Error {
    case badUrl
    case responseError
    case unableToParse
    case noInternetConnection
}
