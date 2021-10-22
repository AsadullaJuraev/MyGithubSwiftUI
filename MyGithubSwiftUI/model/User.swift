//
//  User.swift
//  MyGithubSwiftUI
//
//  Created by Asadulla Juraev on 21/10/21.
//

import Foundation

struct User: Decodable{
    var avatar_url: String
    var bio: String
    var followers: Int
    var following: Int
    var location: String
    var login: String
    var repos_url: String
    var name: String
    var public_repos: Int
}
