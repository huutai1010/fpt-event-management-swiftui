//
//  fpt_event_management_swiftuiApp.swift
//  fpt-event-management-swiftui
//
//  Created by maihuutai on 18/07/2022.
//

import SwiftUI

@main
struct fpt_event_management_swiftuiApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
