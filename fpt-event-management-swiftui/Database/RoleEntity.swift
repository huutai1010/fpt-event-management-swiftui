//
//  RoleEntity.swift
//  fpt-event-management-swiftui
//
//  Created by maihuutai on 26/07/2022.
//

import Foundation
import SQLite

class RoleEntity {
  static let shared     = RoleEntity()
  private let tblRole   = Table("tblRole")
  private let roleID    = Expression<Int64>("roleID")
  private let roleName  = Expression<String>("roleName")

  private init() {
    do {
      if let connection = Database.shared.connection {
        try connection.run(tblRole.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { table in
          table.column(self.roleID, primaryKey: true)
          table.column(self.roleName)
        }))
      }
    } catch {
      let nserror = error as NSError
      print("Cannot create table tblRole. Error: \(nserror)")
    }
  }
}
