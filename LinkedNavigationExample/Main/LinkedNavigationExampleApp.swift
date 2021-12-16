//
//  LinkedNavigationExampleApp.swift
//  LinkedNavigationExample
//
//  Created by Alex Nagy on 17.11.2021.
//

import SwiftUI
import Dot

@main
struct LinkedNavigationExampleApp: App {
    
    @StateObject private var tabs = Tabs(initialSelection: .feed)
    
    @StateObject private var homeContainerNavigation = HomeContainer.Navigation()
    @StateObject private var feedContainerNavigation = FeedContainer.Navigation()
    @StateObject private var postsContainerNavigation =  PostsContainer.Navigation()
    @StateObject private var settingsContainerNavigation =  SettingsContainer.Navigation()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(tabs)
                .environmentObject(homeContainerNavigation)
                .environmentObject(feedContainerNavigation)
                .environmentObject(postsContainerNavigation)
                .environmentObject(settingsContainerNavigation)
//                .onOpenURL { url in
//                    deepLink()
//                }
                .onAppear {
                    deepLink()
                }
        }
    }
    
    func deepLink() {
        tabs.selection = .home
        $homeContainerNavigation.flow.present(.homeSecond, options: .init(style: .sheet)) {
            $homeContainerNavigation.flow.present(.homeThird(title: "Deep Link"))
        }
    }
}
