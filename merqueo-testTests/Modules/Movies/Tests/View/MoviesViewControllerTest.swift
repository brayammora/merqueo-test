//
//  MoviesViewControllerTest.swift
//  merqueo-testTests
//
//  Created by Brayam Alberto Mora Arias on 19/10/21.
//

import XCTest
@testable import merqueo_test

class MoviesViewControllerTest: XCTestCase {
    
    var sut: MoviesViewController?
    let presenter = MockMoviesPresenterInput()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MoviesViewController()
        sut?.presenter = presenter
        presenter.view = sut
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut?.presenter = nil
        presenter.view = nil
        sut = nil
    }
    
    func testValidateNameView() {
        sut?.loadViewIfNeeded()
        XCTAssertEqual(sut?.title, "Movies")
    }

    func testViewDidLoad() {
        // When
        sut?.loadViewIfNeeded()
        
        // Then
        XCTAssertTrue(presenter.calls.didGetMovies)
    }
}
