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
    var navigationController: UINavigationController?
    var coordinatorFactory: CoordinatorFactory?
    
    var childCoordinators: [BaseCoordinator] = []
    
    init(window: UIWindow){
        self.window = window
    }
    
    func start() {
        self.navigationController = UINavigationController()
        self.coordinatorFactory = CoordinatorFactoryImpl()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        runAlphaCoordinator()
    }
    
    private func runAlphaCoordinator(){
        guard let child = coordinatorFactory?.makeAlphaCoordinator(navigationController: navigationController) else { return }
        addDependency(child)
        child.onFinish = { [weak self] in
            self?.removeDependency(child)
        }
        child.runBetaCoordinator = { [weak self] in
            self?.runBetaCoordinator()
        }
        child.start()
    }
    
    private func runBetaCoordinator(){
        guard let child = coordinatorFactory?.makeBetaCoordinator(navigationController: navigationController) else { return }
        addDependency(child)
        child.onFinish = { [weak self] in
            self?.removeDependency(child)
        }
        child.start()
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
