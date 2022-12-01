//
//  SecondView.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import Foundation

protocol SecondView: BaseView {
    var onButtonTapped: (()->Void)? { get set }
}
