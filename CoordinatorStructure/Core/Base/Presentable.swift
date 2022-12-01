//
//  Presentable.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 02/12/22.
//

import UIKit

protocol Presentable {
	func toPresent() -> UIViewController?
	func availableViewController() -> UIViewController?
}
