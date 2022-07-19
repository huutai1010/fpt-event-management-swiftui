//
//  EventEntity.swift
//  fpt-event-management-swiftui
//
//  Created by maihuutai on 18/07/2022.
//

import Foundation
import SQLite

class EventEntity {
  static let shared = EventEntity()
  private let tblEvent = Table("tblEvent")
  private let eventID = Expression<Int64>("eventID")
  private let eventName = Expression<String>("EventName")
  private let description = Expression<String>("description")
  private let location = Expression<String>("location")
  private let posterImage = Expression<String>("posterImage")
  private let backgroundImage = Expression<String>("backgroundImage")

  private init() {
    do {
      if let connection = Database.shared.connection {
        try connection.run(tblEvent.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { table in
          table.column(self.eventID, primaryKey: true)
          table.column(self.eventName)
          table.column(self.description)
          table.column(self.location)
          table.column(self.backgroundImage)
          table.column(self.posterImage)
        }))
      }
    } catch {
      let nserror = error as NSError
      print("Create table not successfully. Error: \(nserror)")
    }
  }

  func queryAll() -> AnySequence<Row>? {
    do {
      if let connection = Database.shared.connection {
        let result: AnySequence<Row> = try connection.prepare(tblEvent)
        return result
      }
    } catch {
      let nserror = error as NSError
      print("Error when query all events. Error: \(nserror)")
      return nil
    }
    return nil
  }
}
