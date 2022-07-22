//
//  ContentView.swift
//  fpt-event-management-swiftui
//
//  Created by maihuutai on 18/07/2022.
//

import SwiftUI
import UserNotifications

struct LoginView: View {
  @State var userID: String = ""
  @State var password: String = ""
  @State var isLoginUserCorrect = false
  @State var isPresentedAlert = false

  var body: some View {
    NavigationView {
      ZStack {
        VStack {
          ZStack(alignment: .bottomTrailing) {
            RoundedCornersShape(corners: [.bottomLeft], radius: 150)
              .foregroundColor(Color.orange.opacity(0.8))
              .frame(height: UIScreen.main.bounds.height / 2.5)

            Text("Login")
              .font(.system(size: 40))
              .foregroundColor(Color.white)
              .padding(.horizontal, 50)
              .padding(.vertical, 50)
          }
          Spacer()


        }
        VStack {
          Spacer()
          Spacer()
          TextField("User ID", text: $userID)
            .customLoginTextField()

          TextField("Password", text: $password)
            .customLoginTextField()
          HStack {
            Spacer()
            Text("Forgot Password ?")
              .padding(.horizontal, 30)
          }
          Button {
            self.isLoginUserCorrect =  UserEntity.shared.login(userName: userID, password: password)
            isPresentedAlert = !isLoginUserCorrect
            print("isActive = \(isPresentedAlert)")
            requestPermissionForNotification() // request notification from user
            scheduleNotification()
          } label: {
            Text("Login")
              .fontWeight(.bold)
              .foregroundColor(Color.white)
              .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 60)
              .background(Color.orange.opacity(0.8))
              .cornerRadius(30)
              .padding(.vertical, 10)
              .padding(.horizontal, 30)
              .shadow(color: Color.gray.opacity(0.8), radius: 3, x: 0, y: 3)
          }
          .alert("Incorrect UserName or Password", isPresented: $isPresentedAlert) {
            Button("OK", role: .cancel) {}
          }

          NavigationLink(destination: destinationView, isActive: $isLoginUserCorrect) {
          }

          HStack {
            Text("Don't have an account ? ")
            Text("Register")
              .foregroundColor(Color.orange.opacity(0.8))
          }
          Spacer()
        }
        .frame(maxHeight: .infinity)
      }
      .ignoresSafeArea()
    }
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
  }

  @ViewBuilder
  var destinationView: some View {
    if isLoginUserCorrect {
      EventTabView()
    } else {
      ErrorView()
    }
  }
}


extension LoginView {
  func requestPermissionForNotification() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
      if success {
        print("All set!")
      } else if let error = error {
        print(error.localizedDescription)
      }
    }
  }

  func scheduleNotification() {
    let content = UNMutableNotificationContent()
    content.title = "Login Successfully"
    content.subtitle = "Welcome to FPT Event Management"
    content.body = "Notification body"
    content.sound = UNNotificationSound.default

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request)
  }
}


extension View {
  func customLoginTextField() -> some View {
    self
      .padding(.all, 20)
      .background(Color.white)
      .cornerRadius(30)
      .padding(.horizontal, 30)
      .padding(.vertical, 10)
      .shadow(color: Color.gray.opacity(0.8), radius: 3, x: 0, y: 3)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}


