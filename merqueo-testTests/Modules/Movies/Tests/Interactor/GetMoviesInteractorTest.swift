//
//  GetMoviesInteractorTest.swift
//  merqueo-testTests
//
//  Created by Brayam Alberto Mora Arias on 19/10/21.
//

import XCTest
@testable import merqueo_test

class GetMoviesInteractorTest: XCTestCase {
    
    var sut: GetMoviesInteractor?
    var repository = MockMoviesRepositoryInput()
    var presenter = MockGetMoviesInteractorOutput()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = GetMoviesInteractor()
        sut?.repository = repository
        repository.remoteDataSource = MockPopularMoviesService()
        repository.interactor = sut
        sut?.presenter = presenter
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut?.repository = nil
        repository.interactor = nil
        sut?.presenter = nil
        sut = nil
    }

    func testGetPopularMoviesShouldFindMovies() {
        // Given
        let expectation = self.expectation(description: "Fetching Movies")
        // When
        sut?.repository?.getPopularMovies()
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        // Then
        XCTAssertTrue(repository.calls.didRetrievePopularMovies)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(presenter.calls.didRetrieveMovies)
        XCTAssertNotNil(repository.calls.popularMovies)
    }

}
