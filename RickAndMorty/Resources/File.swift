//
//  File.swift
//  RickAndMorty
//
//  Created by shanxiafeng on 5/1/23.
//

import UIKit
extension UIView {
    func addSubviews (_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
