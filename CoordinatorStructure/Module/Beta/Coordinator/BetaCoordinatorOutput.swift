//
//  BetaCoordinatorOutput.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import UIKit

protocol BetaCoordinatorOutput: BaseCoordinator {
    var onFinish: (() -> Void)? { get set }
    var factory: BetaFactory? { get set }
}
