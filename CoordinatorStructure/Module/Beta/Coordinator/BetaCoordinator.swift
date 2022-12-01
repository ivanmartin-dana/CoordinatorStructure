//
//  BetaCoordinator.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import Foundation
import UIKit

class BetaCoordinator: BetaCoordinatorOutput {
    var onFinish: (() -> Void)?
    var factory: BetaFactory?
    var navigationController: UINavigationController?
    
    func start() {
        showPrimeroScreen()
    }
    
    private func showPrimeroScreen(){
        guard var vc = factory?.createPrimeroView() else { return }
        vc.onButtonTapped = { [weak self] in
            self?.showSegundoScreen()
        }
        vc.onDismiss = { [weak self] in
            self?.onFinish?()
        }
        navigationController?.pushViewController(vc.viewController, animated: true)
    }
    
    private func showSegundoScreen(){
        guard var vc = factory?.createSegundoView() else { return }
        vc.onButtonTapped = { [weak self] in
            self?.onFinish?()
        }
        navigationController?.pushViewController(vc.viewController, animated: true)
    }
    
}
