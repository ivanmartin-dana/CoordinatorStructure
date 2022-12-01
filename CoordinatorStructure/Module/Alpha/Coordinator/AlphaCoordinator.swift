//
//  AlphaCoordinator.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import Foundation
import UIKit

class AlphaCoordinator: AlphaCoordinatorOutput {
	var router: Router
    var onFinish: (() -> Void)?
    var runBetaCoordinator: (()->Void)?
    var factory: AlphaFactory?
    
	init(router: Router){
		self.router = router
		self.factory = ModuleFactoryImpl()
	}
	
    func start() {
        showFirstScreen()
    }
    
    private func showFirstScreen(){
		guard let view = factory?.createFirstView() else { return }
		view.onButtonTapped = { [weak self] in
            self?.showSecondScreen()
        }
		view.onDismiss = { [weak self] in
            self?.onFinish?()
        }
		router.setRoot(view, animation: .bottomUp)
    }
    
    private func showSecondScreen(){
		guard let view = factory?.createSecondView() else { return }
		view.onButtonTapped = { [weak self] in
            self?.runBetaCoordinator?()
        }
		router.push(view)
    }
    
}
