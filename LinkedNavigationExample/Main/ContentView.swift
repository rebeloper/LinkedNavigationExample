//
//  ContentView.swift
//  LinkedNavigationExample
//
//  Created by Alex Nagy on 17.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var tabs: Tabs
    
    var body: some View {
        TabView(selection: $tabs.selection) {
            HomeContainer()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(TabSelection.home)
            
            FeedContainer()
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(TabSelection.feed)
            
            PostsContainer()
                .tabItem {
                    Image(systemName: "doc")
                }
                .tag(TabSelection.posts)
            
            SettingsContainer()
                .tabItem {
                    Image(systemName: "gear")
                }
                .tag(TabSelection.settings)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
