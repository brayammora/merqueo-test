//
//  MoviesPresenterTest.swift
//  merqueo-testTests
//
//  Created by Brayam Alberto Mora Arias on 19/10/21.
//

import XCTest
@testable import merqueo_test

class MoviesPresenterTest: XCTestCase {
    
    var sut: MoviesPresenter?
    let interactor = MockGetMoviesInteractorInput()
    let router = MockMoviesRouter()
    let view = MockMoviesPresenterOutput()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MoviesPresenter()
        sut?.getMoviesInteractor = interactor
        interactor.presenter = sut
        sut?.router = router
        sut?.view = view
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut?.getMoviesInteractor = nil
        interactor.presenter = nil
        sut?.router = nil
        sut?.view = nil
        sut = nil
    }
    
    func testGetMoviesShouldFindOneMovie() {
        sut?.getMovies()
        XCTAssertTrue(interactor.calls.didExecute)
        XCTAssertEqual(sut?.movies.count, 1)
    }
    
    func testGoToDetailGivenMovieShouldCallNextView() {
        // Given
        let movie = Movie(id: 12345, posterPath: nil)
        let navController = UINavigationController()
        
        // When
        sut?.goToDetail(movie: movie, view: navController)
        
        // Then
        XCTAssertTrue(router.calls.didPresentDetailMovie)
    }
}
