//
//  SRError.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-03.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import Foundation

enum SRError: String, Error {
    case invalidUsername        = "Unable to complete your request. Please check your internet connection."
    case unableToComplete       = "This username created an invalid request. Please check your internet connection, and try again."
    case invalidResponse        = "Invalid response from the server. Possibly unknown user. Please try again."
    case invalidData            = "The data received from the server was invalid. Please try again."
    case unableToFavourite      = "Internal favourites error. Please try again"
    case alreadyInFavourites    = "You have already favourited this user. You must really like them."

}
