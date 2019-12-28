//
//  ViewController.swift
//  Slider-Menu
//
//  Created by Aykut Doğru on 22.12.2019.
//  Copyright © 2019 Aykut Doğru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	let transiton = SlideInTransition()
	var topView: UIView?
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	
	@IBAction func didTapMenu(_ sender: UIBarButtonItem) {
		guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
		menuViewController.didTapMenuType = { menuType in
			self.transitionToNew(menuType)
		}
		menuViewController.modalPresentationStyle = .overCurrentContext
		menuViewController.transitioningDelegate = self
		present(menuViewController, animated: true)
	}
	
	func transitionToNew(_ menuType: MenuType) {
		let title = String(describing: menuType).capitalized
		self.title = title
		
		topView?.removeFromSuperview()
		switch menuType {
		case .profile:
			let view = UIView()
			view.backgroundColor = .blue
			view.frame = self.view.bounds
			self.view.addSubview(view)
			self.topView = view
		case .camera:
			let view = UIView()
			view.backgroundColor = .yellow
			view.frame = self.view.bounds
			self.view.addSubview(view)
			self.topView = view
		default:
			break
		}
	}
}

extension ViewController: UIViewControllerTransitioningDelegate {
	func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		transiton.isPresenting = true
		return transiton
	}
	
	
	
	func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		transiton.isPresenting = false
		return transiton
	}
}


