//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by shanxiafeng on 2/1/23.
//

import UIKit

// Controller to show and search characters
final class RMCharacterViewController: UIViewController,RMCharacterListViewDelegate {
    
    private let characterListView = RMCharacterListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        setUpView()  
    }
    
    private func setUpView(){
        characterListView.delegate = self
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
        // Do any additional setup after loading the view.
    }
    
    //MARK - RMCharacterListViewDelegate
    
    func rmRMCharacterListView(_ characterListView: RMCharacterListView, didSelectCharacter character: RMCharacter) {
        // OPEN detail controller for the character
        let viewModel = RMCharacterDetailViewViewModel(character: character)
        let detailVC  = RMCharacterDetailViewController(viewModel: viewModel)
        
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
