//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by shanxiafeng on 3/1/23.
//

import Foundation

// Represent unique API Endpoint
@frozen enum RMEndpoint: String {
    
    // Endpoint to get character info 
    case character
    // Endpoint to get location info
    case location
    // Endpoint to get episode info
    case episode
    
}
