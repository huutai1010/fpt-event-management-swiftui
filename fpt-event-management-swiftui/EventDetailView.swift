//
//  EventDetailView.swift
//  fpt-event-management-swiftui
//
//  Created by maihuutai on 19/07/2022.
//

import SwiftUI
import MapKit

struct EventDetailView: View {
  var indexImage: Int

  var body: some View {
    NavigationView {
      ZStack {
        Color.white
        ScrollView(.vertical, showsIndicators: false) {
          VStack {
            Image("4")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .shadow(color: Color.gray, radius: 3, x: 0, y: 4)

          }
        }
      }
      .ignoresSafeArea()
    }
    .background(NavigationConfigurator(configure: { navigationConfigurator in
      navigationConfigurator.hidesBarsOnSwipe = true
    }))
  }
}


struct NavigationConfigurator: UIViewControllerRepresentable {
  var configure: (UINavigationController) -> Void = { _ in }

  func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
    UIViewController()
  }
  func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
    if let navigationConfigurator = uiViewController.navigationController {
      self.configure(navigationConfigurator)
    }
  }
}


struct EventDetailView_Previews: PreviewProvider {
  static var previews: some View {
    EventDetailView(indexImage: 1)
    MapView()
  }
}


struct MapView: View {
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.83834, longitude: 14.25405), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
  var body: some View {
    Map(coordinateRegion: $region)
      .frame(width: 350, height: 200)
      .cornerRadius(10)
  }
}

// NavigationConfigurator is from the OP's post: https://stackoverflow.com/a/58427754/7834914
