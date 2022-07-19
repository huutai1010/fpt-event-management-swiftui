//
//  EventDetailView.swift
//  fpt-event-management-swiftui
//
//  Created by maihuutai on 19/07/2022.
//

import SwiftUI

struct EventDetailView: View {
  var body: some View {
    NavigationView {
      ZStack {
        Color.white
        VStack {
          Image("1")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(color: Color.gray, radius: 3, x: 0, y: 4)
          HStack {
            Text("Event")
              .foregroundColor(Color.orange)
              .fontWeight(.bold)
              .padding(.horizontal, 50)
            Spacer()
          }
          Text("Summer vacation FPT University 2022")
            .font(.system(size: 30))
            .fontWeight(.bold)
          HStack {
            Circle()
              .frame(width: 50, height: 50)
              .foregroundColor(Color.yellow)
            VStack {
              Text("27 FEB 2022")
                .foregroundColor(Color.orange)
                .fontWeight(.bold)

              Text("DALAS TEXAS")
                .foregroundColor(Color.gray)
            }
          }
          HStack {
            Circle()
              .frame(width: 50, height: 50)
              .foregroundColor(Color.yellow)
            VStack(alignment: .leading) {
              Text("Club Devil")
              Text("Sai Gon HITech Park")
            }
          }
          Spacer()


          //          Button {
          //
          //          } label: {
          //            Text("Interested")
          //              .foregroundColor(Color.white)
          //              .font(.system(size: 30))
          //              .padding()
          //              .frame(maxWidth: UIScreen.main.bounds.width * 2/3, maxHeight: 50)
          //              .background(Color.orange)
          //              .cornerRadius(30)
          //              .shadow(color: Color.gray, radius: 4, x: 0, y: 4)
          //          }
        }
      }
      .ignoresSafeArea()
    }
  }
}

struct EventDetailView_Previews: PreviewProvider {
  static var previews: some View {
    EventDetailView()
  }
}
