//
//  CoordinatorFactory.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import UIKit

protocol CoordinatorFactory {
    func makeAlphaCoordinator(navigationController: UINavigationController?) -> AlphaCoordinatorOutput
    func makeBetaCoordinator(navigationController: UINavigationController?) -> BetaCoordinatorOutput
}
