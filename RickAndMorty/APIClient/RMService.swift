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
//      - completion: Callback with data and error
    public func execute(_ request: RMRequest, completion: @escaping () -> Void){
        
    }
    
}
