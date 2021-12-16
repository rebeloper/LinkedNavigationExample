//
//  Post.swift
//  LinkedNavigationExample
//
//  Created by Alex Nagy on 17.11.2021.
//

import SwiftUI

struct Post: Identifiable, Equatable {
    let id = UUID().uuidString
    var title: String
}
