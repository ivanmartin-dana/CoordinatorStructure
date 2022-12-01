//
//  FirstView.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import Foundation

protocol FirstView: BaseView {
    var onButtonTapped: (()->Void)? { get set }
    var onDismiss: (()->Void)? { get set }
}
