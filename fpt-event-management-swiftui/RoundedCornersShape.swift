//
//  RoundedCornersShape.swift
//  fpt-event-management-swiftui
//
//  Created by maihuutai on 22/07/2022.
//

import SwiftUI

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


struct RoundedCornersShape_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.orange
      ZStack {
        VStack {
          Spacer()
          RoundedCornersShape(corners: [.topLeft, .topRight], radius: 50)
            .foregroundColor(Color.white)
            .frame(height: UIScreen.main.bounds.height * 0.75)
        }

        VStack {
          HStack {
            Image(systemName: "arrow.left")
              .foregroundColor(Color.white)
              .font(.system(size: 30))
              .position(x: 50, y: 80)
              .frame(maxWidth: 100, maxHeight: 100)
            Spacer()
          }
          Image("applememoji")
            .resizable()
            .clipShape(Circle())
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 200, maxHeight: 200)
            .shadow(radius: 10)

          Text("Mai Huu Tai")
            .fontWeight(.bold)
            .font(.system(size: 30))


          Text("Huutai1010")
            .foregroundColor(Color.gray)
          Spacer()
        }
      }
    }
    .ignoresSafeArea()
  }
}
