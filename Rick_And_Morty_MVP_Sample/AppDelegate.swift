//
//  AppDelegate.swift
//  Rick_And_Morty_MVP_Sample
//
//  Created by mogggiii on 01.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let appearance = UINavigationBarAppearance()
		appearance.configureWithOpaqueBackground()
		appearance.backgroundColor = UIColor(red: 232 / 255, green: 154 / 255, blue: 199 / 255, alpha: 1)
		appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
		appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
		
		UINavigationBar.appearance().standardAppearance = appearance
		UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBar.appearance().standardAppearance
		UINavigationBar.appearance().isTranslucent = false
		UINavigationBar.appearance().prefersLargeTitles = true
		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}


}

