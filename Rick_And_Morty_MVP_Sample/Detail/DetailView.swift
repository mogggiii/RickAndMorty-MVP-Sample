//
//  DetailView.swift
//  Rick_And_Morty_MVP_Sample
//
//  Created by mogggiii on 03.06.2022.
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
	func setCharacterImage(_ url: String)
	func configureUI(_ character: Results)
}

class DetailView: UIView, DetailViewProtocol {
	
	var presenter: DetailViewPresenterProtocol?
	
	fileprivate let characterImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.backgroundColor = .white
		return imageView
	}()
	
	fileprivate let descriptionLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 0
		label.font = .systemFont(ofSize: 17)
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupLayout()
		backgroundColor = .blue
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	fileprivate func setupLayout() {
		addSubview(characterImageView)
		addSubview(descriptionLabel)
		
		NSLayoutConstraint.activate([
			characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
			characterImageView.heightAnchor.constraint(equalToConstant: 200),
			characterImageView.widthAnchor.constraint(equalToConstant: 200),
			characterImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
			
			descriptionLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 20),
			descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
			descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
		])
	}
	
	func setCharacterImage(_ url: String) {
		guard let url = URL(string: url) else { return }
		URLSession.shared.dataTask(with: url) { data, _, error in
			if let error = error {
				print("ZALUPE", error)
				return
			}
			
			guard let data = data else { return }
			
			DispatchQueue.main.async {
				self.characterImageView.image = UIImage(data: data)
			}
		} .resume()
		
	}
	
	func configureUI(_ character: Results) {
		DispatchQueue.main.async {
			self.descriptionLabel.text = character.description
		}
	}
	
}
