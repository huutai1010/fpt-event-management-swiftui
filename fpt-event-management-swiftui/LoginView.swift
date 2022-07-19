//
//  ContentView.swift
//  fpt-event-management-swiftui
//
//  Created by maihuutai on 18/07/2022.
//

import SwiftUI

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
              .foregroundColor(Color.orange)
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
          } label: {
            Text("Login")
              .fontWeight(.bold)
              .foregroundColor(Color.white)
              .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 60)
              .background(Color.orange)
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
              .foregroundColor(Color.orange)
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

struct RoundedCornersShape: Shape {
  let corners: UIRectCorner
  let radius: CGFloat

  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(roundedRect: rect,
                            byRoundingCorners: corners,
                            cornerRadii: CGSize(width: radius, height: radius))
    return Path(path.cgPath)
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


