//
//  DeliveryModuleTests.swift
//  PaackTest-iOSTests
//
//  Created by mohamedmernissi on 1/23/21.
//

import XCTest

class DeliveryModuleTests: XCTestCase {
    
    var presenter: DeliveryDetailsPresenter!
    var interactor: DeliveryDetailsInteractor!
    var router: DeliveryDetailsRouter!

    override func setUp() {
        super.setUp()
        let view = DeliveryDetailsView()
        presenter = DeliveryDetailsPresenter(view: view)
        interactor = DeliveryDetailsInteractor()
        router = DeliveryDetailsRouter()
    }
    
    //function to test the function that calculates the 10 seconds elapsed to send data to the server
    func testThatTimeIntervalIsCorrect(){
        let date = Date(timeIntervalSinceNow: -10)
        let elapsedTime = self.presenter.getElapsedTime(date: date)
        XCTAssertEqual(elapsedTime, 10)
    }
}
