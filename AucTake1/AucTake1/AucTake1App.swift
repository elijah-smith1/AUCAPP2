//
//  AucTake1App.swift
//  AucTake1
//
//  Created by Elijah Smith on 5/19/23.
//

import SwiftUI
import FirebaseCore
import Foundation
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
@main
struct AucTake1App: App {
    var body: some Scene {
       
        WindowGroup {
            LaunchView()
        }
    }
}
