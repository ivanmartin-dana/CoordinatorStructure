//
//  AlphaFactoryImpl.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import Foundation

extension ModuleFactoryImpl: AlphaFactory {
    func createFirstView() -> FirstView {
        return FirstVC()
    }
    func createSecondView() -> SecondView {
        return SecondVC()
    }
}
