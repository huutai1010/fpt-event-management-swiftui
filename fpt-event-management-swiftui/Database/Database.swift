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
}
