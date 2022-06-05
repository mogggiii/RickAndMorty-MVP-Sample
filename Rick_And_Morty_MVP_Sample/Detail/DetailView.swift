//
//  DetailView.swift
//  Rick_And_Morty_MVP_Sample
//
//  Created by mogggiii on 03.06.2022.
//

import UIKit
import AlamofireImage

protocol DetailViewProtocol: AnyObject {
	func setCharacterImage(_ url: String)
	func configureUI(_ character: Results)
}

class DetailView: UIView, DetailViewProtocol {
	
	private enum Constants: CGFloat {
		case imageSize = 250
		case imageTopSpace = 80
		case labelSpacing = 40
	}
	
	var presenter: DetailViewPresenterProtocol?
	
	fileprivate let characterImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.clipsToBounds = true
		imageView.contentMode = .scaleAspectFill
		imageView.backgroundColor = .white
		return imageView
	}()
	
	fileprivate let descriptionLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 0
		label.font = .systemFont(ofSize: 17, weight: .semibold)
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupLayout()
		backgroundColor = .systemBackground
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	fileprivate func setupLayout() {
		addSubview(characterImageView)
		addSubview(descriptionLabel)
		
		characterImageView.layer.cornerRadius = 20
		
		NSLayoutConstraint.activate([
			characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.imageTopSpace.rawValue),
			characterImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize.rawValue),
			characterImageView.widthAnchor.constraint(equalToConstant: Constants.imageSize.rawValue),
			characterImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
			
			descriptionLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: Constants.labelSpacing.rawValue),
			descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.labelSpacing.rawValue),
			descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.labelSpacing.rawValue)
		])
	}
	
	func setCharacterImage(_ url: String) {
		guard let url = URL(string: url) else { return }
		characterImageView.af.setImage(withURL: url)
	}
	
	func configureUI(_ character: Results) {
		descriptionLabel.text = character.description
	}
	
}
