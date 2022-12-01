//
//  CoordinatorFactory.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import UIKit

protocol CoordinatorFactory {
	func makeAlphaCoordinator(router: Router?) -> (coordinator: AlphaCoordinatorOutput, toPresent: Presentable?)
	func makeBetaCoordinator(router: Router?) -> (coordinator: BetaCoordinatorOutput, toPresent: Presentable?)
}
