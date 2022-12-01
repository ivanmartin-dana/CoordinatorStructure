//
//  AlphaCoordinator.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import Foundation
import UIKit

class AlphaCoordinator: AlphaCoordinatorOutput {
    var onFinish: (() -> Void)?
    var runBetaCoordinator: (()->Void)?
    var factory: AlphaFactory?
    var navigationController: UINavigationController?
    
    func start() {
        showFirstScreen()
    }
    
    private func showFirstScreen(){
        guard var vc = factory?.createFirstView() else { return }
        vc.onButtonTapped = { [weak self] in
            self?.showSecondScreen()
        }
        vc.onDismiss = { [weak self] in
            self?.onFinish?()
        }
        navigationController?.pushViewController(vc.viewController, animated: true)
    }
    
    private func showSecondScreen(){
        guard var vc = factory?.createSecondView() else { return }
        vc.onButtonTapped = { [weak self] in
            self?.runBetaCoordinator?()
        }
        navigationController?.pushViewController(vc.viewController, animated: true)
    }
    
}
