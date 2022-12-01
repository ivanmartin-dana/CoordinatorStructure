//
//  BetaFactoryImpl.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import Foundation

extension ModuleFactoryImpl: BetaFactory {
    func createPrimeroView() -> PrimeroView {
        return PrimeroVC()
    }
    
    func createSegundoView() -> SegundoView {
        return SegundoVC()
    }
}
