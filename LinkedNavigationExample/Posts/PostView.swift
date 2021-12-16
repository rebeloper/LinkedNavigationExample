//
//  PostView.swift
//  LinkedNavigationExample
//
//  Created by Alex Nagy on 17.11.2021.
//

import SwiftUI

struct PostView: View {
    
    var post: Post
    
    var body: some View {
        VStack {
            Text("Hello, \(post.title)!")
        }
        .navigationTitle("Post")
    }
}

