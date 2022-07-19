//
//  Tweet.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//

import Foundation

struct Tweet: Identifiable {
    
    let id: String
    let text: String
    let userId: String
    let profileImage: String
    let timestamp: String
    let likes: Int
}
