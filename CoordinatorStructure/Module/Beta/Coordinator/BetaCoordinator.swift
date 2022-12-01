//
//  BetaCoordinator.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import Foundation
import UIKit

class BetaCoordinator: BetaCoordinatorOutput {
	var router: Router
    var onFinish: (() -> Void)?
    var factory: BetaFactory?
    
	init(router: Router){
		self.router = router
		self.factory = ModuleFactoryImpl()
	}
	
    func start() {
        showPrimeroScreen()
    }
    
    private func showPrimeroScreen(){
        guard let view = factory?.createPrimeroView() else { return }
		view.onButtonTapped = { [weak self] in
            self?.showSegundoScreen()
        }
		view.onDismiss = { [weak self] in
            self?.onFinish?()
        }
		router.setRoot(view)
    }
    
    private func showSegundoScreen(){
        guard let view = factory?.createSegundoView() else { return }
		view.onButtonTapped = { [weak self] in
			self?.router.dismiss()
            self?.onFinish?()
        }
		router.push(view)
    }
    
}
