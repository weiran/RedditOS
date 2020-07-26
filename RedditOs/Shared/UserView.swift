//
//  UserView.swift
//  RedditOs
//
//  Created by Thomas Ricouard on 26/07/2020.
//

import SwiftUI
import Backend
import SDWebImageSwiftUI

struct UserView: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 32) {
            Spacer()
            if let avatar = user.avatarURL {
                WebImage(url: avatar)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(8)
            }
            VStack(alignment: .center, spacing: 16) {
                HStack(spacing: 32) {
                    makeStatsView(number: user.commentKarma.toRoundedSuffixAsString(),
                                  name: "Comment Karma")
                    makeStatsView(number: user.linkKarma.toRoundedSuffixAsString(),
                                  name: "Link Karma")
                }
                if let created = user.createdUtc {
                    VStack {
                        Text(created, style: .relative)
                            .font(.title)
                            .fontWeight(.bold)
                        Text("User since")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                }
            }
            Spacer()
        }
    }
    
    private func makeStatsView(number: String, name: String) -> some View {
        VStack {
            Text(number)
                .font(.title)
                .fontWeight(.bold)
            Text(name)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.gray)
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: static_user)
    }
}
