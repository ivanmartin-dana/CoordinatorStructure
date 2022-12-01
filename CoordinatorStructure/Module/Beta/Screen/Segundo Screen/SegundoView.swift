//
//  SegundoView.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import Foundation

protocol SegundoView: BaseView {
    var onButtonTapped: (()->Void)? { get set }
}
