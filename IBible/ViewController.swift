//
//  ViewController.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 13/04/23.
//

import UIKit
import Swinject


class ViewController: UIViewController {
    
    private let viewmodel: ViewModel = DIContainer.shared.container.resolve(ViewModel.self)!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewmodel.createUser()
        
    }


}

