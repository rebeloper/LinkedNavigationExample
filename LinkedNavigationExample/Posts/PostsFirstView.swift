//
//  PostsFirstView.swift
//  LinkedNavigationExample
//
//  Created by Alex Nagy on 17.11.2021.
//

import SwiftUI
import Dot

struct PostsFirstView: View {
    
    @State private var posts = [
        Post(title: "Post 0"),
        Post(title: "Post 1")
    ]
    
    @EnvironmentObject private var postsContainerNavigation: PostsContainer.Navigation
    
    var body: some View {
        VStack {
//            ScrollView {
//                ForEach(posts) { post in
//                    feedCellView(post)
//                }
//            }
            
            ForEach(posts) { post in
                feedCellView(post)
            }
            .scrolls(.vertically)
        }
        .navigationTitle("Feed")
    }
    
    func feedCellView(_ post: Post) -> some View {
        HStack {
            Text(post.title)
//            Spacer()
            Pusher()
        }
        .onTapGesture {
            didTapCell(post)
        }
    }
    
    func didTapCell(_ post: Post) {
        $postsContainerNavigation.flow.present(.postView(post: post))
    }
}

