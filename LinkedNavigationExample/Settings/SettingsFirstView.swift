//
//  SettingsFirstView.swift
//  LinkedNavigationExample
//
//  Created by Alex Nagy on 16.12.2021.
//

import SwiftUI
import Dot

struct SettingsFirstView: View {
    
    @State private var post = Post(title: "Edit me")
    
    @EnvironmentObject private var settingsContainerNavigation: SettingsContainer.Navigation
    
    var body: some View {
        VStack {
            Text("Post: \(post.title)!")
            Button {
                presentSettingsSecondView()
            } label: {
                Text("Present SettingsSecondView")
            }
        }
        .navigationTitle("Settings")
    }
    
    func presentSettingsSecondView() {
        $settingsContainerNavigation.flow.present(.settingsSecond(post: $post), options: .init(style: .sheet))
    }
}


