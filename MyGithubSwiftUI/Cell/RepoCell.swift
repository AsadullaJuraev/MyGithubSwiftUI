//
//  RepoCell.swift
//  MyGithubSwiftUI
//
//  Created by Asadulla Juraev on 22/10/21.
//

import Foundation
import SwiftUI

struct RepoCell: View{
    
    var repo: Repositories
    
    var body: some View{
        VStack{
            HStack{
                ZStack{
                    Color.random
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                    Text(String((repo.name.first!)).uppercased())
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                
                    
                HStack{
                    VStack(alignment:.leading){
                        Text(repo.name)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text(repo.full_name)
                            .font(.caption)
                            .foregroundColor(.gray.opacity(0.7))
                    }
                    Spacer()
                    VStack(alignment:.trailing){
                        Link(destination: URL(string: repo.html_url)!) {
                            Image(systemName: "link.circle.fill")
                                .font(.largeTitle)
                        }
                        
                    }
                }
                
            }
            Divider()
        }
        
    }
    
}


extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
