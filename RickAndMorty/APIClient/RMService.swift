//
//  RMService.swift
//  RickAndMorty
//
//  Created by shanxiafeng on 3/1/23.
//

import Foundation

// Primary API service object to get Rick and Morty Data

final class RMService{

//  Shared singleton instance
    static let shared = RMService()
    
//  Privatized constructor
    private init(){
        
    }
    
//  Send Rick and Morty API Call
//    - parameters:
//      - request: Requested instance
//      - type: The type of object we expect to get back
//      - completion: Callback with data and error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<String, Error>) -> Void
    ){
        
    }
    
}
