//
//  UserEntity.swift
//  fpt-event-management-swiftui
//
//  Created by maihuutai on 18/07/2022.
//

import Foundation
import SQLite

class UserEntity {
  static let shared = UserEntity()
  private let tblUser = Table("tblUser")
  private let userID = Expression<Int64>("userID")
  private let userName = Expression<String>("userName")
  private let password = Expression<String>("password")
  private let fullName = Expression<String>("fullName")
  private let address = Expression<String>("address")
  private let phone = Expression<String>("phone")
  private let roleName = Expression<String>("roleName")

  private init() {
    do {
      if let connection = Database.shared.connection {
        try connection.run(tblUser.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { table in
          table.column(self.userID, primaryKey: true)
          table.column(self.userName)
          table.column(self.password)
          table.column(self.fullName)
          table.column(self.address)
          table.column(self.phone)
          table.column(self.roleName)
        }))
      }
    } catch {
      let nserror = error as NSError
      print("Create table not successfully. Error: \(nserror)")
    }
  }

  func insert(userName: String, password: String?, fullName: String?, address: String?, phone: String?, roleName: String?) -> Int64? {
    do {
      let insert = tblUser.insert(self.userName <- userName,
                                  self.password <- password ?? "",
                                  self.fullName <- fullName ?? "",
                                  self.address <- address ?? "",
                                  self.phone <- phone ?? "",
                                  self.roleName <- roleName ?? "")
      let insertID = try Database.shared.connection?.run(insert)
      return insertID
    } catch {
      let nserror = error as NSError
      print("Cannot insert new user. Error: \(nserror)")
      return nil
    }
  }

  // Query all user in tblUser
  func queryAll() -> AnySequence<Row>? {
    do {
      let result: AnySequence<Row>? = try Database.shared.connection?.prepare(self.tblUser)
      return result
    } catch {
      let nserror = error as NSError
      print("Cannot insert new Department. Error is: \(nserror), \(nserror.userInfo)")
      return nil
    }
  }

  //filter
  func filter(fullName: String) -> AnySequence<Row>? {
    do {
      let filterCondition: Expression<Bool> = self.fullName == fullName
      let result: AnySequence<Row>? = try Database.shared.connection?.prepare(tblUser.filter(filterCondition))
      return result
    } catch {
      let nserror = error as NSError
      print("Can not filter name of user. Error \(nserror)")
      return nil
    }
  }

  func login(userName: String, password: String) -> Bool {
    do {
      var count = 0
      let loginCondition: Expression<Bool> = self.userName == userName && self.password == password
      let listLoginUser: AnySequence<Row>? = try Database.shared.connection?.prepare(tblUser.filter(loginCondition))
      for eachLoginUser in listLoginUser! {
        UserEntity.shared.toString(user: eachLoginUser)
        count += 1
      }
      if count == 1 {
        return true
      } else {
        return false
      }
    } catch {
      let nserror = error as NSError
      print("Error when login. Error: \(nserror)")
      return false
    }
  }
  

  func toString(user: Row) {
    print("""
        userID = \(user[self.userID]),
        userName = \(user[self.userName]),
        password = \(user[self.password]),
        fullName = \(user[self.fullName]),
        address = \(user[self.address]),
        phone = \(user[self.phone]),
        roleName = \(user[self.roleName])
        """)
  }
}
