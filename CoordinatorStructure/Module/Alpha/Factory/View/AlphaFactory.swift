//
//  AlphaFactory.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import Foundation

protocol AlphaFactory {
    func createFirstView() -> FirstView
    func createSecondView() -> SecondView
}
