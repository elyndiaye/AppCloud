//
//  Constants.swift
//  App
//
//  Created by ely.assumpcao.ndiaye on 20/09/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation


typealias CompletionHandler = (_ Success: Bool, _ errorMessage :String?) -> ()

// URL Constants
let BASE_URL = "https://cloud.nousdigital.net/s/sBDBJqFnfeBPrQR/download"

//Segues
let TO_DETAIL = "toDetail"
let TO_FAVORITES = "toFavorites"

// Movies Defaults
let TITLE = "title"
let GENRE_IDS = "genre_ids"
let OVERVIEW = "overview"
let USER_NAME = "userName"
let IMG = "Img"


// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8",
    "Accept": "application/json"
]
