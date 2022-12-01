//
//  AlphaCoordinatorOutput.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import UIKit

protocol AlphaCoordinatorOutput: BaseCoordinator {
    var onFinish: (()->Void)? { get set }
    var runBetaCoordinator: (()->Void)? { get set }
    var factory: AlphaFactory? { get set }
}
