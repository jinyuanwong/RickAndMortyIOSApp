//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by shanxiafeng on 2/1/23.
//

import UIKit

// Controller to show and search characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        // Do any additional setup after loading the view.
        let request = RMRequest(
            endpoint: .character,
            queryParameters: [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "status", value: "alive")
            ]
        )
        
        print(request.url)
        
    }

}
