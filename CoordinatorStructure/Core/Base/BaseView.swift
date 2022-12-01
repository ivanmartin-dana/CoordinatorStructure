//
//  BaseView.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import UIKit

protocol BaseView {
    var viewController: UIViewController { get }
    var presentationStyle: UIModalPresentationStyle { get set }
}
