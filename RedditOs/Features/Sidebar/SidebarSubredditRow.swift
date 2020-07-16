//
//  SidebarSubredditRow.swift
//  RedditOs
//
//  Created by Thomas Ricouard on 16/07/2020.
//

import SwiftUI
import Backend
import SDWebImageSwiftUI

struct SidebarSubredditRow: View {
    let name: String
    let iconURL: String?
    
    var body: some View {
        NavigationLink(destination: SubredditPostsListView(name: name)) {
            HStack {
                if let image = iconURL,
                   let url = URL(string: image) {
                    WebImage(url: url)
                        .resizable()
                        .frame(width: 16, height: 16)
                        .cornerRadius(8)
                } else {
                    Image(systemName: "globe")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
                Text(name.capitalized)
            }
        }
    }
}

struct SidebarSubredditRow_Previews: PreviewProvider {
    static var previews: some View {
        SidebarSubredditRow(name: "Test", iconURL: nil)
    }
}