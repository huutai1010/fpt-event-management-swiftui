//
//  AppDelegate.swift
//  fpt-event-management-swiftui
//
//  Created by maihuutai on 18/07/2022.
//

import Foundation
import SwiftUI
import UIKit
import SQLite
import UserNotifications

// no changes in your AppDelegate class
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

//    UserEntity.shared.insert(email: "huutaia21010@gmail.com", password: "123", fullName: "Mai Huu Tai", address: "Tien Giang", phone: "0858155621", avatar: "")
//    UserEntity.shared.insert(email: "admin", password: "1", fullName: "Admin", address: "", phone: "", avatar: "", roleID: 1)
    return true
  }

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    
  }
}
