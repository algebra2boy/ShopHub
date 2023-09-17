//
//  TabViewMenuNavigation.swift
//  ShopHubTests
//
//  Created by Yongye Tan on 9/16/23.
//

import XCTest
@testable import ShopHub

class TabViewMenuNavigation: XCTestCase {
    
    private var tabViewModel: MenuTabViewModel!
    
    // try to initialize a menuTabViewModel object
    override func setUpWithError() throws {
        tabViewModel = MenuTabViewModel()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTabMenuCounts() throws {
        XCTAssert(tabViewModel.tabs.count == 3)
    }
    
    func testTabMenuItems() throws {
        let tabs = tabViewModel.tabs
        XCTAssertTrue(tabs[0] == .products)
        XCTAssertTrue(tabs[1] == .cart)
        XCTAssertTrue(tabs[2] == .user)
    }
    
    
}
