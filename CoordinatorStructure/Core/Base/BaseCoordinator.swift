//
//  BaseCoordinator.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import UIKit

protocol BaseCoordinator: AnyObject {
    var navigationController: UINavigationController? { get set }
    func start()
}
