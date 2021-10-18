//
//  DetailMovie.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import Foundation

struct DetailMovie: Codable {
    let originalTitle: String
    let overview: String?
    let backdropPath: String?
    let releaseDate: String
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case overview = "overview"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case status = "status"
    }
}

