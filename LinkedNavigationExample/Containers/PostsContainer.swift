//
//  PostsContainer.swift
//  LinkedNavigationExample
//
//  Created by Alex Nagy on 17.11.2021.
//

import SwiftUI
import Dot

struct PostsContainer: View {
    
    @EnvironmentObject private var navigation: PostsContainer.Navigation
    
    var body: some View {
        NavigationStack($navigation.flow, style: .stack) { page in
            switch page {
            case .postsFirst:
                PostsFirstView()
            case .postView(let post):
                PostView(post: post)
            }
        }
    }
}

extension PostsContainer {
    class Navigation: ObservableObject {
        
        enum Page: Equatable {
            case postsFirst
            case postView(post: Post)
        }
        
        @Published var flow = NavigationFlow<Page>(root: .postsFirst)
    }
}

