//
//  DetailViewPresenter.swift
//  Rick_And_Morty_MVP_Sample
//
//  Created by mogggiii on 03.06.2022.
//

import Foundation

protocol DetailViewPresenterProtocol: AnyObject {
	init(view: DetailViewProtocol, service: Service, character: Results)
	var character: Results { get }
	func fetchCharacterInfo()
}

class DetailViewPresenter: DetailViewPresenterProtocol {
	
	weak var view: DetailViewProtocol?
	private let service: Service?
	var character: Results
	
	required init(view: DetailViewProtocol, service: Service, character: Results) {
		self.view = view
		self.service = service
		self.character = character
	}
	
	func fetchCharacterInfo() {
		service?.fetchCharacter(character.url, completion: { [weak self] result in
			switch result {
			case .success(let character):
				print("cff", character.description)
				self?.character = character
				self?.view?.setCharacterImage(character.image)
				self?.view?.configureUI(character)
			case .failure(let error):
				print(error)
			}
		})
	}
	
	
}
