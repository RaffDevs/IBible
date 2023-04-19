//
//  Coordinator.swift
//  IBible
//
//  Created by Rafael Veronez Dias on 18/04/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    
    func start()
    
    init(navigationController: UINavigationController)
}
