//
//  Repo.swift
//  MyGithubSwiftUI
//
//  Created by Asadulla Juraev on 22/10/21.
//

import Foundation


struct Repositories : Decodable{
    
    var name: String
    var full_name: String
    var language: String?
    var html_url: String
}
