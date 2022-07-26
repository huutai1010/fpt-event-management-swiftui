//
//  UserEntity.swift
//  fpt-event-management-swiftui
//
//  Created by maihuutai on 18/07/2022.
//

import Foundation
import SQLite

class UserEntity {
  static let shared     = UserEntity()
  private let tblUser   = Table("tblUser")
  private let userID    = Expression<Int64>("userID")
  private let email     = Expression<String>("email")
  private let password  = Expression<String>("password")
  private let fullName  = Expression<String>("fullName")
  private let address   = Expression<String>("address")
  private let phone     = Expression<String>("phone")
  private let avatar    = Expression<String>("avatar")
  private let roleID    = Expression<Int64>("roleID")

  // create table user in database
  private init() {
    do {
      if let connection = Database.shared.connection {
        try connection.run(tblUser.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { table in
          table.column(self.userID, primaryKey: true)
          table.column(self.email)
          table.column(self.password)
          table.column(self.fullName)
          table.column(self.address)
          table.column(self.phone)
          table.column(self.avatar)
          table.column(self.roleID)
        }))
      }
    } catch {
      let nserror = error as NSError
      print("Cannot create table tblUser. Error is \(nserror), \(nserror.userInfo)")
    }
  }

  func insert(email: String, password: String?, fullName: String?, address: String?, phone: String?, avatar: String?, roleID: Int64 = 2) -> Int64? {
    do {
      let insert = tblUser.insert(self.email <- email,
                                  self.password <- password ?? "",
                                  self.fullName <- fullName ?? "",
                                  self.address  <- address ?? "",
                                  self.phone    <- phone ?? "",
                                  self.avatar   <- avatar ?? "",
                                  self.roleID   <- roleID)
      let insertID = try Database.shared.connection?.run(insert)
      return insertID
    } catch {
      let nserror = error as NSError
      print("Cannot insert new user. Error: \(nserror)")
      return nil
    }
  }

  // get all users in tblUser
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

  func checkLogin(email: String, password: String) -> (isLoginSuccessful: Bool, roleName: String) {
    do {
      var numberOfAccountRecords = 0
      var isUser = false
      var isAdmin = false

      let loginAdminCondition: Expression<Bool> = self.email == email && self.password == password && roleID == 1
      let loginUserCondition: Expression<Bool>  = self.email == email && self.password == password && roleID == 2
      if let listLoginUser: AnySequence<Row>    = try Database.shared.connection?.prepare(tblUser.filter(loginUserCondition)) {
        for eachLoginUser in listLoginUser {
          UserEntity.shared.toString(user: eachLoginUser) // print list of login user with roleID = 2 (user)
          numberOfAccountRecords += 1
          isUser = true
        }
      }
      if let listLoginAdmin: AnySequence<Row> = try Database.shared.connection?.prepare(tblUser.filter(loginAdminCondition)) {
        for eachLoginAdmin in listLoginAdmin {
          UserEntity.shared.toString(user: eachLoginAdmin)
          numberOfAccountRecords += 1
          isAdmin = true
        }
      }
      print("----------------------Login Process-------------------")
      print("| numberOfAccountRecords = \(numberOfAccountRecords)  ")
      print("| isUser                 = \(isUser)                  ")
      print("| isAdmin                = \(isAdmin)                 ")
      print("------------------------------------------------------")

      if numberOfAccountRecords == 1 && isUser {
        return (true, "User")
      } else if numberOfAccountRecords == 1 && isAdmin {
        return (true, "Admin")
      } else {
        return (false, "Undefined")
      }
    } catch {
      let nserror = error as NSError
      print("Error when login. Error is \(nserror), \(nserror.userInfo)")
      return (false, "Undefined")
    }
  }
  

  func toString(user: Row) {
    print("""
        --------------User---------------
        userID   = \(user[self.userID])
        userName = \(user[self.email])
        password = \(user[self.password])
        fullName = \(user[self.fullName])
        address  = \(user[self.address])
        phone    = \(user[self.phone])
        roleID   = \(user[self.roleID])
        ---------------------------------
        """)
  }
}
