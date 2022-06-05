//
//  DetailViewController.swift
//  Rick_And_Morty_MVP_Sample
//
//  Created by mogggiii on 03.06.2022.
//

import UIKit

class DetailViewController: UIViewController {
	
	private enum Constants: CGFloat {
		case spacing = 16
		case size = 30
	}
	
	var detailView = DetailView()
	
	fileprivate let closeButton: UIButton = {
		let button = UIButton()
		let imageConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(systemName: "xmark.square.fill")?.withConfiguration(imageConfig), for: .normal)
		button.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
		return button
	}()
	
	// MARK: - VC lifecycle
	
	override func loadView() {
		view = detailView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		detailView.presenter?.fetchCharacterInfo()
		configureCloseButton()
	}
	
	// MARK: - Fileprivate
	
	fileprivate func configureCloseButton() {
		view.addSubview(closeButton)
		
		closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.spacing.rawValue).isActive = true
		closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.spacing.rawValue).isActive = true
		closeButton.heightAnchor.constraint(equalToConstant: Constants.size.rawValue).isActive = true
		closeButton.widthAnchor.constraint(equalToConstant: Constants.size.rawValue).isActive = true
	}
	
	// MARK: - Objc fileprivate
	@objc fileprivate func handleClose() {
		dismiss(animated: true)
	}
}
