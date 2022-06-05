//
//  CharacterCell.swift
//  Rick_And_Morty_MVP_Sample
//
//  Created by mogggiii on 02.06.2022.
//

import UIKit

class CharacterCell: UITableViewCell {
	
	var character: Results? {
		didSet {
			guard let character = character else { return }
			characterName.text = character.name
			
			guard let url = URL(string: character.image) else { return }
			characterImageView.af.setImage(withURL: url)
		}
	}
	
	fileprivate let characterImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.backgroundColor = .gray
		imageView.layer.cornerRadius = 60 / 2
		return imageView
	}()
	
	fileprivate let characterName: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 16)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		contentView.backgroundColor = UIColor(red: 232 / 255, green: 154 / 255, blue: 199 / 255, alpha: 0.4)
		configureCell()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	fileprivate func configureCell() {
		contentView.addSubview(characterImageView)
		contentView.addSubview(characterName)
		
		NSLayoutConstraint.activate([
			characterImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
			characterImageView.heightAnchor.constraint(equalToConstant: 60),
			characterImageView.widthAnchor.constraint(equalToConstant: 60),
			
			characterName.centerYAnchor.constraint(equalTo: characterImageView.centerYAnchor),
			characterName.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 16),
			characterName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
		])
	}
}
