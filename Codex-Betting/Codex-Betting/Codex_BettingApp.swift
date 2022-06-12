//
//  Codex_BettingApp.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 04/02/22.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import RealmSwift
import FirebaseFirestore
import GoogleSignIn

@main
struct Codex_BettingApp: SwiftUI.App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            FirebaseApp.configure()
            
            do {
                let realm = try Realm()
                debugPrint("GET REALM", realm)
            } catch {
                debugPrint("ERROR CONFIGURING REALM", error.localizedDescription)
            }
            
            return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
    
}
