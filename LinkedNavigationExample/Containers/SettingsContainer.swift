//
//  SettingsContainer.swift
//  LinkedNavigationExample
//
//  Created by Alex Nagy on 16.12.2021.
//

import SwiftUI
import Dot

struct SettingsContainer: View {
    
    @EnvironmentObject private var navigation: SettingsContainer.Navigation
    
    var body: some View {
        NavigationStack($navigation.flow, style: .stack) { page in
            switch page {
            case .settingsFirst:
                SettingsFirstView()
            case .settingsSecond(let post):
                SettingsSecondView(post: post)
            }
        }
    }
}

extension SettingsContainer {
    class Navigation: ObservableObject {
        
        enum Page {
            case settingsFirst
            case settingsSecond(post: Binding<Post>)
        }
        
        @Published var flow = NavigationFlow<Page>(root: .settingsFirst)
    }
}


