//
//  NetworkManager.swift
//  Rick_And_Morty_MVP_Sample
//
//  Created by mogggiii on 02.06.2022.
//

import Foundation

protocol NetworkManagerProtocol: AnyObject {
	func fetchData(url: String, completion: @escaping (Result<RickAndMorty, Error>) ->())
	func fetchCharacter(_ url: String, completion: @escaping (Result<Results, Error>) -> ())
}

class Service: NetworkManagerProtocol {
	
	fileprivate func fetchData<T: Decodable>(_ url: String, completion: @escaping (Result<T, Error>) -> ()) {
		guard let url = URL(string: url) else { return }
		
		URLSession.shared.dataTask(with: url) { data, _, error in
			if let error = error {
				print(error)
				return
			}
			
			guard let data = data else { return }
			
			do {
				let data = try JSONDecoder().decode(T.self, from: data)
				
				DispatchQueue.main.async {
					completion(.success(data))
				}
			} catch let error {
				completion(.failure(error))
			}
		} .resume()
	}
	
	func fetchData(url: String, completion: @escaping (Result<RickAndMorty, Error>) -> ()) {
		self.fetchData(url, completion: completion)
	}
	
	func fetchCharacter(_ url: String, completion: @escaping (Result<Results, Error>) -> ()) {
		self.fetchData(url, completion: completion)
	}
}
