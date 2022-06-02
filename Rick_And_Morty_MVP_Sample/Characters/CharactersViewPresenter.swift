//
//  CharactersViewPresenter.swift
//  Rick_And_Morty_MVP_Sample
//
//  Created by mogggiii on 02.06.2022.
//

import Foundation

protocol CharactersViewPresenterProtocol: AnyObject {
	init(view: CharactersViewProtocol?, networkManager: NetworkManagerProtocol)
	var rickAndMorty: RickAndMorty? { get }
	func fetchCharactersWithUrl(_ url: String)
}

class CharactersViewPresenter: CharactersViewPresenterProtocol {
	
	weak var view: CharactersViewProtocol?
	let service: NetworkManagerProtocol
	var rickAndMorty: RickAndMorty?
	
	required init(view: CharactersViewProtocol?, networkManager: NetworkManagerProtocol) {
		self.view = view
		service = networkManager
	}
	
	func fetchCharactersWithUrl(_ url: String) {
		service.fetchData(url: url) { [weak self] result in
			switch result {
			case .success(let rickAndMorty):
				self?.rickAndMorty = rickAndMorty
				self?.view?.reloadData()
			case .failure(let error):
				print("Error", error)
			}
		}
	}
}
