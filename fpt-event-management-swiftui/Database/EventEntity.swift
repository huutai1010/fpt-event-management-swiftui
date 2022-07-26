//
//  EventEntity.swift
//  fpt-event-management-swiftui
//
//  Created by maihuutai on 18/07/2022.
//

import Foundation
import SQLite

class EventEntity {
  static let shared           = EventEntity()
  private let tblEvent        = Table("tblEvent")
  private let eventID         = Expression<Int64>("eventID")
  private let eventName       = Expression<String>("EventName")
  private let detail          = Expression<String>("detail")
  private let location        = Expression<String>("location")
  private let posterImage     = Expression<String>("posterImage")
  private let backgroundImage = Expression<String>("backgroundImage")
  private let host            = Expression<String>("userName")

  private init() {
    do {
      if let connection = Database.shared.connection {
        try connection.run(tblEvent.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { table in
          table.column(self.eventID, primaryKey: true)
          table.column(self.eventName)
          table.column(self.detail)
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
      let result: AnySequence<Row>? = try Database.shared.connection?.prepare(self.tblEvent)
      return result
    } catch {
      let nserror = error as NSError
      print("Cannot insert new Department. Error is: \(nserror), \(nserror.userInfo)")
      return nil
    }
  }

  // insert new event record
  func insert(eventName: String, detail: String?, location: String?, backgroundImage: String?, posterImage: String?) -> Int64? {
    do {
      let insert = tblEvent.insert(self.eventName       <- eventName,
                                   self.detail          <- detail ?? "",
                                   self.location        <- location ?? "",
                                   self.backgroundImage <- backgroundImage ?? "",
                                   self.posterImage     <- posterImage ?? "")
      let insertID = try Database.shared.connection?.run(insert)
      return insertID
    } catch {
      let nserror = error as NSError
      print("Cannot insert new event. Error is \(nserror), \(nserror.userInfo)")
      return nil
    }
  }

  //filter
  func filter(eventName: String) -> AnySequence<Row>? {
    do {
      let filterCondition: Expression<Bool> = self.eventName == eventName
      let result: AnySequence<Row>? = try Database.shared.connection?.prepare(tblEvent.filter(filterCondition))
      return result
    } catch {
      let nserror = error as NSError
      print("Can not filter name of user. Error \(nserror)")
      return nil
    }
  }
}
