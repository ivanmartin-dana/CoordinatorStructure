//
//  CoordinatorFactoryImpl.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import UIKit

class CoordinatorFactoryImpl: CoordinatorFactory {
    func makeAlphaCoordinator(navigationController: UINavigationController?) -> AlphaCoordinatorOutput {
        let coordinator = AlphaCoordinator()
        coordinator.navigationController = navigationController
        coordinator.factory = ModuleFactoryImpl()
        return coordinator
    }
    
    func makeBetaCoordinator(navigationController: UINavigationController?) -> BetaCoordinatorOutput {
        let coordinator = BetaCoordinator()
        coordinator.navigationController = navigationController
        coordinator.factory = ModuleFactoryImpl()
        return coordinator
    }
}
