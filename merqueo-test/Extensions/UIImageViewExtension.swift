//
//  UIImageViewExtension.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import Foundation

import UIKit

extension UIImageView {
    
    func downloadImage(from path: String) {
        guard let url = URL(string: path) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.name
        
        let task = URLSession.shared.dataTask(with: request) { (data, _, _) in
            guard let data = data,
                  let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
}
