//
//  FeedFirstView.swift
//  LinkedNavigationExample
//
//  Created by Alex Nagy on 17.11.2021.
//

import SwiftUI
import Dot

struct FeedFirstView: View {
    
    @State private var feed = ["Alex", "Bob", "Claire"]
    
    @EnvironmentObject private var feedContainerNavigation: FeedContainer.Navigation
    
    var body: some View {
        List {
            ForEach(feed, id:\.self) { person in
                feedCellView(person)
            }
        }
        .navigationTitle("Feed")
    }
    
    func feedCellView(_ person: String) -> some View {
        HStack {
            Text(person)
//            Spacer()
            Pusher()
        }
        .onTapGesture {
            didTapCell(person)
        }
    }
    
    func didTapCell(_ person: String) {
        $feedContainerNavigation.flow.present(.feedSecond(person: person))
    }
}

struct FeedFirstView_Previews: PreviewProvider {
    static var previews: some View {
        FeedFirstView()
    }
}
