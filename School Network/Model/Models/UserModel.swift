//
//  UserModel.swift
//  School Network
//
//  Created by Mu qi Zhang on 10/4/22.
//

import Foundation


class User {
    var uid: String
    var email: String?
    var displayName: String?

    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
