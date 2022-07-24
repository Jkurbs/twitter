//
//  Tweet.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//

import Foundation

struct Tweet: Identifiable, Equatable {
    let id: Int
    let content: String
    let user: String
    
    var username: String {
        user.components(separatedBy: " ").first?.lowercased() ?? "unkown"
    }
}
