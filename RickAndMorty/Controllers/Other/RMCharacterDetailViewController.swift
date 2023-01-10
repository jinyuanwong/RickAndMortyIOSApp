//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by shanxiafeng on 6/1/23.
//

import UIKit

// Controller to show info about single character
final class RMCharacterDetailViewController: UIViewController {
    
    private let viewModel: RMCharacterDetailViewViewModel
    
    init(viewModel: RMCharacterDetailViewViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        
    }
    
    required init?(coder: NSCoder){
        fatalError("Unsupported")
    }
    
    // MARK - Life cycle funciton

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        title = viewModel.title

        // Do any additional setup after loading the view.
    }
    
    


}
