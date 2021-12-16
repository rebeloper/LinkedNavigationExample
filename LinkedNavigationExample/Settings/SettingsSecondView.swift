//
//  SettingsSecondView.swift
//  LinkedNavigationExample
//
//  Created by Alex Nagy on 16.12.2021.
//

import SwiftUI

struct SettingsSecondView: View {
    
    @Binding var post: Post
    
    var body: some View {
        VStack {
            TextField("Post title", text: $post.title)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
        .navigationTitle("Settings Second")
    }
}
