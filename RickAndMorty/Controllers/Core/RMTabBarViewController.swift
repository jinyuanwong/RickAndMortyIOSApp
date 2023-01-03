//
//  ViewController.swift
//  RickAndMorty
//
//  Created by shanxiafeng on 2/1/23.
//

import UIKit



final class RMTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        setUpTabs() // Very important!!!
    }

    private func setUpTabs(){
        
        let charactersVC = RMCharacterViewController()
        let locationsVC = RMLocationViewController()
        let episodesVC = RMEpisodeViewController()
        let settingsVC = RMSettingsViewController()
        
        charactersVC.navigationItem.largeTitleDisplayMode = .automatic
        locationsVC.navigationItem.largeTitleDisplayMode = .automatic
        episodesVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic

        let nv1 = UINavigationController(rootViewController: charactersVC)
        let nv2 = UINavigationController(rootViewController: locationsVC)
        let nv3 = UINavigationController(rootViewController: episodesVC)
        let nv4 = UINavigationController(rootViewController: settingsVC)
        
        nv1.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName:"figure.stand"), tag: 1)
        nv2.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName:"location.circle"), tag: 2)
        nv3.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName:"tv"), tag: 3)
        nv4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName:"gear"), tag: 4)
        
        for nv in [nv1,nv2,nv3,nv4] {
            nv.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [nv1,nv2,nv3,nv4],
            animated: true
        )
    }

}

