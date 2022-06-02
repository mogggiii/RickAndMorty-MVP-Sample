//
//  CharactersViewController.swift
//  Rick_And_Morty_MVP_Sample
//
//  Created by mogggiii on 02.06.2022.
//

import UIKit

protocol CharactersViewProtocol: AnyObject {
	func reloadData()
}

class CharactersViewController: UITableViewController {
	
	fileprivate var presenter: CharactersViewPresenterProtocol?
	fileprivate let url = URLS.rickandmortyapi.rawValue
	fileprivate let reuseId = "reuseId"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.title = "Rick and Morty"
		
		configureTableView()
		presenterConfigure()
	}
	
	fileprivate func presenterConfigure() {
		let networManager = NetworkManager()
		presenter = CharactersViewPresenter(view: self, networkManager: networManager)
		presenter?.fetchCharactersWithUrl(url)
	}
	
	fileprivate func configureTableView() {
		tableView.register(CharacterCell.self, forCellReuseIdentifier: reuseId)
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter?.rickAndMorty?.results.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? CharacterCell else {
			return UITableViewCell()
		}
		
		let character = presenter?.rickAndMorty?.results[indexPath.row]
		cell.character = character
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 75
	}
}

extension CharactersViewController: CharactersViewProtocol {
	func reloadData() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
}
