//
//  Router.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 02/12/22.
//

import Foundation

protocol Router: Presentable {
	func present(_ module: Presentable?)
	func present(_ module: Presentable?, animated: Bool)
	func present(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)
	
	func dismiss()
	func dismiss(animated: Bool)
	func dismiss(animated: Bool, completion: (() -> Void)?)
	
	func setRoot(_ module: Presentable?)
	func setRoot(_ module: Presentable?, animation: Animation)
	
	func push(_ module: Presentable?)
	func push(_ module: Presentable?, animated: Bool)
	
	
	func pop()
	func pop(animated: Bool)
	
	func popToRoot(animated: Bool)
}
