//
//  CustomerTabBar.swift
//  fpt-event-management-swiftui
//
//  Created by maihuutai on 19/07/2022.
//

import SwiftUI

struct CustomTabBar: View {

  @Binding var selectedTab: String
  @State var tabPoints: [CGFloat]

  var body: some View {
      HStack(spacing: 0) {
        TabBarButton(image: "house", selectedTab: $selectedTab, tabPoints: $tabPoints)
        TabBarButton(image: "bookmark", selectedTab: $selectedTab, tabPoints: $tabPoints)
        TabBarButton(image: "message", selectedTab: $selectedTab, tabPoints: $tabPoints)
        TabBarButton(image: "person", selectedTab: $selectedTab, tabPoints: $tabPoints)
      }
      .padding()
      .background(
        Color.white
          .clipShape(TabCurve(tabPoint: getCurvedPoint() - 15))
      )
      .overlay(
        Circle()
          .fill(Color.white)
          .frame(width: 10, height: 10)
          .offset(x: getCurvedPoint() - 20)
        ,alignment: .bottomLeading
      )
      .cornerRadius(30)
      .padding(.horizontal)
    }

  func getCurvedPoint() -> CGFloat {
    if tabPoints.isEmpty {
      return 10
    } else {
      switch selectedTab {
      case "house":
        return tabPoints[0]
      case "bookmark":
        return tabPoints[1]
      case "message":
        return tabPoints[2]
      default:
        return tabPoints[3]
      }
    }
  }
}

struct CustomerTabBar_Previews: PreviewProvider {
    static var previews: some View {
        EventTabView()
    }
}

struct TabBarButton: View {

  var image: String
  @Binding var selectedTab: String
  @Binding var tabPoints: [CGFloat]

  var body: some View {
    GeometryReader { reader -> AnyView in

      let midX = reader.frame(in: .global).midX

      DispatchQueue.main.async {
        if tabPoints.count <= 4 {
          tabPoints.append(midX)
        }
      }

      return AnyView(
        Button(action: {
          withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)) {
            selectedTab = image
          }
        }, label: {

          Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "")")
            .font(.system(size: 25, weight: .semibold))
            .foregroundColor(Color.black)
            .offset(y: selectedTab == image ? -10 : 0)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      )
    }
    .frame(height: 50)
  }
}
