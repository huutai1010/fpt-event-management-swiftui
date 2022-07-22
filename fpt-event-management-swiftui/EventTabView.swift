//
//  HomeView.swift
//  fpt-event-management-swiftui
//
//  Created by maihuutai on 18/07/2022.
//

import Foundation
import SwiftUI

struct EventTabView: View {
  @State var selectedTab = "house"

  var body: some View {

    ZStack(alignment: .bottom) {

      switch selectedTab {
      case "house":
        EventsView()
      case "bookmark":
        View1()
      case "message":
        View2()
      default:
        ProfileView()
      }
      CustomTabBar(selectedTab: $selectedTab, tabPoints: [0.5])
        .shadow(radius: 5)
    }
  }
}

struct EventsView: View {

  var body: some View {
      ZStack {
        Color.white
          .ignoresSafeArea()

        ScrollView(.vertical, showsIndicators: false) {
          ForEach(1..<7) { index in
            CardEventView(index: index)
          }
        }
      }
      .navigationBarHidden(false)
      .navigationBarTitle("Events")
      .navigationBarBackButtonHidden(true)
  }
}

struct CardEventView: View {
  @State var isPressed = true
  var index: Int
  var body: some View {
    NavigationLink(destination: EventDetailView(indexImage: index)) {
      VStack {
        VStack(alignment: .center) {
          Image("\(index)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .padding()
            .shadow(color: Color.gray, radius: 10, x: 3, y: 3)

          HStack() {
            Image(systemName: "mappin.and.ellipse")
            Text("FPT University, Long Thanh My Ward")
              .fontWeight(.bold)

            Button(action: {
              isPressed.toggle()
            }) {
              Image(systemName: "heart.fill").foregroundColor(isPressed == true ?  Color.pink : Color.gray)
            }
          }
          .foregroundColor(Color.black)

          HStack {
            Text("Event for student in school")
              .foregroundColor(Color.black)
              .padding(.horizontal, 55)
            Spacer()
          }
        }
      }
      .padding(.vertical, 25)
    }
  }
}


struct View1: View {
  var body: some View {
    ZStack {
      Color.white
        .ignoresSafeArea()
      Text("View 1")
    }
  }
}

struct View2: View {
  var body: some View {
    ZStack {
      Color.white
        .ignoresSafeArea()
      Text("View 2")
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    EventTabView()
  }
}

