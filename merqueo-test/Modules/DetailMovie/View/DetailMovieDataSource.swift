//
//  DetailMovieDataSource.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import UIKit

final class DetailMovieDataSource: NSObject {
    
    private var data: Movie?

    override init() { }
    
    func configure(data: Movie) {
        self.data = data
    }
}

extension DetailMovieDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


