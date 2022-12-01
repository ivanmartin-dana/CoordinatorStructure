//
//  BetaFactory.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import Foundation

protocol BetaFactory {
    func createPrimeroView() -> PrimeroView
    func createSegundoView() -> SegundoView
}
