//
//  DetailMovieTableViewSections.swift
//  merqueo-test
//
//  Created by Brayam Alberto Mora Arias on 18/10/21.
//

import Foundation

enum DetailMovieTableViewSections: CaseIterable {
    case summary
    case image
    case releaseDate
    case status
    
    var titleHeader: String {
        switch self {
        case .summary:
            return "Summary:"
        case .releaseDate:
            return "Release date"
        case .status:
            return "Status"
        default:
            return ""
        }
    }
}
