//
//  UIViewController+Extensions.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import UIKit

extension UIViewController: BaseView {
    var viewController: UIViewController {
        return self
    }
    
    var presentationStyle: UIModalPresentationStyle {
        get {
            modalPresentationStyle
        }
        set {
            self.modalPresentationStyle = newValue
        }
    }
    
    
}
