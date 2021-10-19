//
//  LoadingScreen.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 19/10/21.
//

import UIKit

fileprivate var containerLoading: UIView?

extension UIViewController {
    func showLoading () {
        containerLoading = UIView(frame: view.bounds)
        guard let containerLoading = containerLoading else {
            return
        }
        
        containerLoading.backgroundColor = .lightGray
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = containerLoading.center
        activityIndicator.startAnimating()
        containerLoading.addSubview(activityIndicator)
        view.addSubview(containerLoading)
    }
    
    func hideLoading () {
        containerLoading?.removeFromSuperview()
        containerLoading = nil
    }
}
