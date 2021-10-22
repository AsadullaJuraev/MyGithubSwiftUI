//
//  ContentView.swift
//  MyGithubSwiftUI
//
//  Created by Asadulla Juraev on 22/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView(user: User(avatar_url: "", bio: "", followers: 1, following: 1, location: "", login: "", repos_url: "", name: "", public_repos: 1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
