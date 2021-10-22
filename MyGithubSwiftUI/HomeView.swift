//
//  ContentView.swift
//  MyGithubSwiftUI
//
//  Created by Asadulla Juraev on 21/10/21.
//

import SwiftUI
import SDWebImageSwiftUI
import MapKit

struct HomeView: View {
    static var UrlGithub = "https://api.github.com/users/AsadullaJuraev"
    
    @ObservedObject var viewModel = homeViewModel()
    @State var user: User
    
    var body: some View {
        NavigationView{
            ZStack{
                if !user.avatar_url.isEmpty {
                    GeometryReader{ proxy in
                        VStack(alignment: .center){
                            HStack{
                                Spacer()
                                VStack(alignment:.trailing){
                                    Text(String(user.followers))
                                        .fontWeight(.bold)
                                        .font(.system(size: 19))
                                    Text("Followers")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.gray.opacity(0.7))
                                }
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 18).stroke(lineWidth: 2)
                                        .frame(width: 84, height: 84)
                                        .foregroundColor(Color.gray)
                                    WebImage(url: URL(string: user.avatar_url))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(18)
                                }
                                
                                VStack(alignment:.leading){
                                    Text(String(user.following))
                                        .fontWeight(.bold)
                                        .font(.system(size: 19))
                                    Text("Following")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.gray.opacity(0.7))
                                }
                                Spacer()
                            }
                            .padding()
                            HStack{
                                Spacer()
                                Text(user.login)
                                    .fontWeight(.bold)
                                    .font(.system(size: 15))
                                HStack{}
                                .frame(width: 2, height: 15)
                                .background(Color.gray.opacity(0.4))
                                .padding([.horizontal], 5)
                                Text("@\(user.name)")
                                    .fontWeight(.bold)
                                    .font(.system(size: 15))
                                Spacer()
                            }
                            Text(user.bio)
                                .font(.subheadline)
                                .foregroundColor(.gray.opacity(0.8))
                            HStack{
                                VStack(alignment:.leading){
                                    Text("Public repositories: ")
                                        .foregroundColor(.gray)
                                    + Text("\(user.public_repos)")
                                    Text("Location: ")
                                        .foregroundColor(.gray)
                                    + Text("\(user.location)")
                                }
                                Spacer()
                            }.padding()
                            
                            
                            ScrollView{
                                if !viewModel.repo.isEmpty{
                                    ForEach(0..<viewModel.repo.count, id: \.self){ item in
                                        
                                        RepoCell(repo: viewModel.repo[item])
                                            .padding(.horizontal)
                                    }
                                }else{
                                    ProgressView()
                                }
                                
                            }
                            
                        }
                    }
                }else{
                    ProgressView()
                }
            }
            
            .navigationBarTitle("Github User", displayMode: .inline)
            
        }
        .onAppear{
            viewModel.getInfo(url: HomeView.UrlGithub) { user in
                print(user)
                self.user = user
                viewModel.getRepos(url: user.repos_url)
            }
        }
    }
    
}
