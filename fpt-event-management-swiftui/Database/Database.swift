//
//  Database.swift
//  fpt-event-management-swiftui
//
//  Created by maihuutai on 18/07/2022.
//

import Foundation
import SQLite

class Database {
  static let shared = Database()
  public let connection: Connection?
  public let databaseFileName = "fptEventManagement.sqlite3"
  private init() {
    let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as String?
    do {
      connection = try Connection("\(dbPath!)/\(databaseFileName)")
      print("\(dbPath!)/\(databaseFileName)")
    } catch {
      connection = nil
      let nserror = error as NSError
      print("Cannot connect to Database. Error is: \(nserror), \(nserror.userInfo)")
    }
  }

  func getDocumentDirectory() -> String {
    var strURL = ""
    do {
      let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
      let documentDirectory = paths[0]
      strURL = try String(contentsOf: documentDirectory)
    } catch {
      let nserror = error as NSError
      print("Error when convert URL to String. Error \(nserror)")
    }
    return strURL
  }
}
