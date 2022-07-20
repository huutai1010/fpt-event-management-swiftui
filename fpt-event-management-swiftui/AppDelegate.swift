//
//  AppDelegate.swift
//  fpt-event-management-swiftui
//
//  Created by maihuutai on 18/07/2022.
//

import Foundation
import SwiftUI
import UIKit

// no changes in your AppDelegate class
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
//      UserEntity.shared.insert(userName: "Huutai1010", password: "123", fullName: "Mai Huu Tai", address: "Tien Giang", phone: "0858155621", avatar: "", roleName: "user")
//      UserEntity.shared.insert(userName: "Hieptran", password: "456", fullName: "Tran Thanh Hiep", address: "HCM City", phone: "0123456789", avatar: "", roleName: "user")
//      UserEntity.shared.insert(userName: "Chuongvu", password: "789", fullName: "Vu Nguyen Huy Chuong", address: "Ninh Thuan", phone: "0123456789", avatar: "", roleName: "user")
        return true
    }

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    
  }
}

// /Users/maihuutai/Library/Developer/CoreSimulator/Devices/2BB4A4B6-9052-46B9-9A32-4DDA58328320/data/Containers/Data/Application/CED19AE4-7F5B-4D0D-80D5-9895D7002A60/Documents/fptEventManagement.sqlite3


