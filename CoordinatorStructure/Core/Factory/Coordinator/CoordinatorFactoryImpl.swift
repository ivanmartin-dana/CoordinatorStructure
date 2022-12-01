//
//  CoordinatorFactoryImpl.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import UIKit

class CoordinatorFactoryImpl: CoordinatorFactory {
	func makeAlphaCoordinator(router: Router?) -> (coordinator: AlphaCoordinatorOutput, toPresent: Presentable?) {
		let router = router ?? RouterImpl()
		return (AlphaCoordinator(router: router) , router)
	}
	
	func makeBetaCoordinator(router: Router?) -> (coordinator: BetaCoordinatorOutput, toPresent: Presentable?) {
		let router = router ?? RouterImpl()
		return (BetaCoordinator(router: router) , router)
	}
}
