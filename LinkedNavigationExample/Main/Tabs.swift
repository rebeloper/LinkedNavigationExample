//
//  Tabs.swift
//  LinkedNavigationExample
//
//  Created by Alex Nagy on 17.11.2021.
//

import SwiftUI

class Tabs: ObservableObject {
    
    @Published var selection: TabSelection = .home
    
    init(initialSelection: TabSelection) {
        self.selection = initialSelection
    }
}

enum TabSelection {
    case home
    case feed
    case posts
}
