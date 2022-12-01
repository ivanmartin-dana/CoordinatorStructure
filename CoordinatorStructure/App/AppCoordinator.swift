//
//  AppCoordinator.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator {
    let window: UIWindow
	var router: Router
    var coordinatorFactory: CoordinatorFactory?
    
    var childCoordinators: [BaseCoordinator] = []
    
    init(window: UIWindow){
        self.window = window
		self.router = RouterImpl()
		self.window.rootViewController = router.toPresent()
		self.window.makeKeyAndVisible()
    }
    
    func start() {
        self.coordinatorFactory = CoordinatorFactoryImpl()
        
        runAlphaCoordinator(router: router)
    }
    
	private func runAlphaCoordinator(router: Router?){
        guard let (coordinator, _) = coordinatorFactory?.makeAlphaCoordinator(router: router) else { return }
		coordinator.onFinish = { [weak self] in
            self?.removeDependency(coordinator)
        }
		coordinator.runBetaCoordinator = { [weak self] in
            self?.runBetaCoordinator(router: nil)
        }
		addDependency(coordinator)
		coordinator.start()
    }
    
	private func runBetaCoordinator(router: Router?){
        guard let (coordinator, module) = coordinatorFactory?.makeBetaCoordinator(router: router) else { return }
		coordinator.onFinish = { [weak self] in
            self?.removeDependency(coordinator)
        }
		addDependency(coordinator)
		self.router.present(module)
		coordinator.start()
    }
    
    private func addDependency(_ coordinator: BaseCoordinator){
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: BaseCoordinator?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
        else { return }
        
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
        print("dependencies: ",childCoordinators)
    }
    
    func clearDependency(){
        guard childCoordinators.isEmpty == false else { return }
        childCoordinators.removeAll()
    }
}
