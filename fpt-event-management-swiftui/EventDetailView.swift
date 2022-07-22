//
//  EventDetailView.swift
//  fpt-event-management-swiftui
//
//  Created by maihuutai on 19/07/2022.
//

import SwiftUI
import MapKit

struct EventDetailView: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @State private var isFollowed = false
  var indexImage: Int

  var body: some View {
    ZStack {
      Color.white

      VStack {
        ZStack(alignment: Alignment.topLeading) {
          Image("\(indexImage)")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
            .shadow(color: Color.gray, radius: 5, x: 0, y: 4)

          Button(action: {
            self.presentationMode.wrappedValue.dismiss()
          }) {
            Image(systemName: "arrow.backward")
              .foregroundColor(Color.black)
              .font(.system(size: 35))
              .frame(width: 60, height: 60)
              .background(Color.white)
              .cornerRadius(50)
              .position(x: 50, y: 100)
              .shadow(radius: 5)

          }
        }

        ScrollView(.vertical, showsIndicators: false) {
          HStack {
            Text("Tunnel of Love")
              .font(.system(size: 30))
              .fontWeight(.bold)
              .padding(.horizontal)
              .padding(.vertical, 5)

            Spacer()
            Button(action: {}) {
              Image(systemName: "heart")
                .font(.system(size: 30))
                .foregroundColor(Color.black)
                .padding(.horizontal)
            }
          }

          VStack {
            HStack {
              Text("Description")
                .foregroundColor(Color.gray)
                .padding(.horizontal)
              Spacer()
            }
            Text("Meltdown Time is come from a song that called the same name as this art. It represents our feeling when we gonna break our boundaries in life.")
              .frame(maxWidth: .infinity)
              .padding(.horizontal)
          }
          .padding(.vertical, 5)

          VStack {
            HStack {
              Text("Time")
                .padding(.horizontal)
                .foregroundColor(Color.gray)

              Spacer()
            }
            HStack {
              Text("27 July 2022")
                .padding(.horizontal)
              Spacer()
            }
          }
          .padding(.vertical, 5)

          VStack {
            HStack {
              Text("Time")
                .padding(.horizontal)
                .foregroundColor(Color.gray)
              Spacer()
            }

            HStack {
              Text("Room 101, FPT University")
                .padding(.horizontal)
              Spacer()
            }
          }

        }
        .padding(.vertical, 5)
        .frame(maxHeight: UIScreen.main.bounds.height * (1 / 3) * 0.9)
        Button(action: {}) {
          Text("Register")
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.orange)
            .cornerRadius(5)
            .padding(.horizontal)
            .padding(.vertical)
        }
      }
    }
    .ignoresSafeArea()
    .navigationBarHidden(true)
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


struct MapView: View {
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.83834, longitude: 14.25405), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
  var body: some View {
    Map(coordinateRegion: $region)
      .frame(width: 350, height: 200)
      .cornerRadius(10)
  }
}

// NavigationConfigurator is from the OP's post: https://stackoverflow.com/a/58427754/7834914
struct EventDetailView_Previews: PreviewProvider {
  static var previews: some View {
    EventDetailView(indexImage: 1)
  }
}
