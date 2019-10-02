//
//  ItemViewController.swift
//  AppTests
//
//  Created by ely.assumpcao.ndiaye on 21/09/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Nimble_Snapshots
@testable import App

class ItemViewControllerSpec: QuickSpec {
    override func spec() {
        var controller: ItemViewController!
        describe("MovieSearchViewController") {
            
            beforeEach {
                controller = ItemViewController()
                controller.service = ItemServiceMock()
                controller.beginAppearanceTransition(true, animated: false)
                controller.endAppearanceTransition()
            }
            
            it("should have a valid instance") {
                expect(controller).toNot(beNil())
            }

            it("should have the expected number of Items") {
                print(controller.items.count)
                expect(controller.items.count).to(equal(8))
            }
        }
    }
}
