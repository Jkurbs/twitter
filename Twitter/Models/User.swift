//
//  User.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//

import Foundation

class User {
    
    let id: String
    let profileImage: String
    let emailAddress: String
    var tweets: [Tweet]? = []

    init(id: String, profileImage: String, emailAddress: String, tweets: [Tweet]? = []) {
        self.id = id
        self.profileImage = profileImage
        self.emailAddress = emailAddress
        self.tweets = tweets
    }
}
