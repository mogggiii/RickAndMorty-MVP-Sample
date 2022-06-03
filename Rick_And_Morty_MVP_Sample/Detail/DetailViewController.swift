//
//  DetailViewController.swift
//  Rick_And_Morty_MVP_Sample
//
//  Created by mogggiii on 03.06.2022.
//

import UIKit

class DetailViewController: UIViewController {
	
	var detailView = DetailView()
	
	fileprivate let closeButton: UIButton = {
		let button = UIButton()
		button.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
		return button
	}()
	
	override func loadView() {
		view = detailView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		detailView.presenter?.fetchCharacterInfo()
	}
	
	@objc fileprivate func handleClose() {
		dismiss(animated: true)
	}
}
