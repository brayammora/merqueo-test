//
//  MoviesRepositoryTest.swift
//  merqueo-testTests
//
//  Created by Brayam Alberto Mora Arias on 19/10/21.
//


import XCTest
@testable import merqueo_test

class MoviesRepositoryTest: XCTestCase {
    
    var sut: MoviesRepository?
    var remoteDataSource = MockPopularMoviesService()
    var interactor = MockMoviesRepositoryOutput()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MoviesRepository()
        sut?.interactor = interactor
        sut?.remoteDataSource = remoteDataSource
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut?.remoteDataSource = nil
        sut?.interactor = nil
        sut = nil
    }

    func testGetPopularMovies() {
        sut?.getPopularMovies()
        
        XCTAssertTrue(interactor.calls.didRetrievePopularMovies)
    }

}
