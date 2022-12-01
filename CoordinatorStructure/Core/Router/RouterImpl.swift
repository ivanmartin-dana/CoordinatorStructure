//
//  RouterImpl.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 02/12/22.
//

import UIKit

final class RouterImpl: NSObject, Router {
	private var rootController: UINavigationController?
	
	init(rootController: UINavigationController = UINavigationController()){
		self.rootController = rootController
	}
	
	func toPresent() -> UIViewController? {
		return rootController
	}
	
	func availableViewController() -> UIViewController? {
		return rootController?.viewControllers.last
	}
	
	func present(_ module: Presentable?) {
		present(module, animated: true)
	}
	
	func present(_ module: Presentable?, animated: Bool) {
		present(module, animated: animated, completion: nil)
	}
	
	func present(_ module: Presentable?, animated: Bool, completion: (() -> Void)?) {
		guard let controller = module?.toPresent() else { return }
		controller.modalPresentationStyle = .fullScreen
		rootController?.present(controller, animated: animated, completion: completion)
	}
	
	func dismiss() {
		dismiss(animated: true)
	}
	
	func dismiss(animated: Bool) {
		dismiss(animated: animated, completion: nil)
	}
	
	func dismiss(animated: Bool, completion: (() -> Void)?) {
		rootController?.dismiss(animated: animated, completion: completion)
	}
	
	func setRoot(_ module: Presentable?) {
		setRoot(module, animation: .fadeIn)
	}
	
	func setRoot(_ module: Presentable?, animation: Animation) {
		guard let controller = module?.toPresent() else { return }
		rootController?.setViewControllers([controller], animated: false)
		
		let transition = CATransition()
		switch animation {
		case .fadeIn:
			transition.duration = CFTimeInterval(0.3)
			transition.type = .fade
			transition.subtype = .fromTop
			rootController?.view.layer.add(transition, forKey: kCATransition)
		case .bottomUp:
			transition.duration = 0.5
			transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
			transition.type = .moveIn
			transition.subtype = .fromTop
			rootController?.view.layer.add(transition, forKey: nil)
		case .topDown:
			transition.duration = 0.5
			transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
			transition.type = .moveIn
			transition.subtype = .fromBottom
			rootController?.view.layer.add(transition, forKey: nil)
		}
	}
	
	func push(_ module: Presentable?) {
		push(module, animated: true)
	}
	
	func push(_ module: Presentable?, animated: Bool) {
		guard let controller = module?.toPresent(),
			  (controller is UINavigationController == false)
		else { return }
		rootController?.pushViewController(controller, animated: animated)
	}
	
	func pop() {
		pop(animated: true)
	}
	
	func pop(animated: Bool) {
		rootController?.popViewController(animated: animated)
	}
	
	func popToRoot(animated: Bool) {
		rootController?.popToRootViewController(animated: animated)
	}
	
	
}
