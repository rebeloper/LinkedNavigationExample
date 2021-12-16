//
//  HomeFourthView.swift
//  LinkedNavigationExample
//
//  Created by Alex Nagy on 17.11.2021.
//

import SwiftUI
import Dot

struct HomeFourthView: View {
    
    @EnvironmentObject private var homeContainerNavigation: HomeContainer.Navigation
    @EnvironmentObject private var tabs: Tabs
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Button {
                dismissPop()
            } label: {
                Text("Dismiss")
            }
            
            Button {
                pop()
            } label: {
                Text("Pop")
            }
            
            Button {
                popLastTwo()
            } label: {
                Text("Pop Last Two")
            }
            
            Button {
                popToIndex(1)
            } label: {
                Text("Pop To Index One")
            }
            
            Button {
                popToRoot()
            } label: {
                Text("Pop To Root")
            }
            
            Button {
                replaceNavigationFlow()
            } label: {
                Text("Replace Navigation Flow")
            }
            
            Button {
                switchTab()
            } label: {
                Text("Switch Tab")
            }

        }
        .navigationTitle("Home Fourth")
        .navigationBarHidden(true)
    }
}

extension HomeFourthView {
    func dismissPop() {
        dismiss()
    }
    
    func pop() {
        $homeContainerNavigation.flow.pop()
    }
    
    func popLastTwo() {
        $homeContainerNavigation.flow.pop(last: 2)
    }
    
    func popToIndex(_ index: Int) {
        $homeContainerNavigation.flow.popTo(index: index)
    }
    
    func popToRoot() {
        $homeContainerNavigation.flow.popToRoot()
    }
    
    func replaceNavigationFlow() {
        $homeContainerNavigation.flow.popToRoot {
            $homeContainerNavigation.flow.replaceNavigationFlow(newPageElements: [
                NavigationPageElement(page: .homeFirst),
                NavigationPageElement(page: .homeSecond, options: .init(style: .sheet))
            ])
        }
    }
    
    func switchTab() {
        $homeContainerNavigation.flow.popToRoot {
            tabs.selection = .feed
        }
    }
}
