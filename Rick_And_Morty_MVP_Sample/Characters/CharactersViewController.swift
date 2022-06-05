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

protocol DetailViewControllerProtocol: AnyObject {
	func generateDetailViewController(with charachter: Results) -> UIViewController
}

class CharactersViewController: UITableViewController {
	
	fileprivate var presenter: CharactersViewPresenterProtocol?
	fileprivate let url = URLS.rickandmortyapi.rawValue
	fileprivate let reuseId = "reuseId"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.title = "Rick and Morty"
//		navigationController?.navigationBar.prefersLargeTitles = true
		
		configureTableView()
		presenterConfigure()
	}
	
	fileprivate func presenterConfigure() {
		let networManager = Service()
		presenter = CharactersViewPresenter(view: self, networkManager: networManager)
		presenter?.fetchCharactersWithUrl(url)
	}
	
	fileprivate func configureTableView() {
		tableView.register(CharacterCell.self, forCellReuseIdentifier: reuseId)
		tableView.backgroundColor = UIColor(red: 232 / 255, green: 154 / 255, blue: 199 / 255, alpha: 0.3)
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
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let character = presenter?.rickAndMorty?.results[indexPath.row] else { return }
		let detailViewController = self.generateDetailViewController(with: character)
		detailViewController.modalPresentationStyle = .fullScreen
		present(detailViewController, animated: true)
	}
}

extension CharactersViewController: CharactersViewProtocol {
	func reloadData() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
}


extension CharactersViewController: DetailViewControllerProtocol {
	func generateDetailViewController(with charachter: Results) -> UIViewController {
		let viewController = DetailViewController()
		let view = viewController.detailView
		let service = Service()
		let presenter = DetailViewPresenter(view: view, service: service, character: charachter)
		view.presenter = presenter
		return viewController
	}
}
