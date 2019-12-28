//
//  MenuViewController.swift
//  Slider-Menu
//
//  Created by Aykut Doğru on 22.12.2019.
//  Copyright © 2019 Aykut Doğru. All rights reserved.
//

import UIKit

enum MenuType: Int {
	case home
	case camera
	case profile
}

class MenuViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
	
	@IBOutlet weak var tableView: UITableView!
	var didTapMenuType: ((MenuType) -> Void)?
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.reloadData()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		if indexPath.row == 0 {
			cell.textLabel?.text = "Home"
		} else if indexPath.row == 1 {
			cell.textLabel?.text = "Camera"
		} else {
			cell.textLabel?.text = "Profile"
		}
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let menuType = MenuType(rawValue: indexPath.row) else { return }
		self.dismiss(animated: true) { [weak self] in
			print("Dismissing: \(menuType)")
			self?.didTapMenuType?(menuType)
		}
	}
}
