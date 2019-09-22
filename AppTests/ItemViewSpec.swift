//
//  ItemViewControllerSpec.swift
//  AppTests
//
//  Created by ely.assumpcao.ndiaye on 20/09/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import App


class ItemViewSpec: QuickSpec {
    override func spec() {
        describe("Screen ItemView") {
            it("has valid snapshot") {
                let frame = UIScreen.main.bounds
                let view = ItemView(frame: frame)
                expect(view) == recordSnapshot("ItemView")
            }
        }
    }
}
