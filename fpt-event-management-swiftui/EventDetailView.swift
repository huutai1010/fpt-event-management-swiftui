//
//  EventDetailView.swift
//  fpt-event-management-swiftui
//
//  Created by maihuutai on 19/07/2022.
//

import SwiftUI

struct EventDetailView: View {
  var indexImage: Int

  var body: some View {
    NavigationView {
      ZStack {
        Color.white
        ScrollView(.vertical, showsIndicators: false) {
          VStack {
            Image("\(indexImage)")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .shadow(color: Color.gray, radius: 3, x: 0, y: 4)

          }
        }
      }
      .ignoresSafeArea()
    }
  }
}

struct EventDetailView_Previews: PreviewProvider {
  static var previews: some View {
    EventDetailView(indexImage: 1)
  }
}
