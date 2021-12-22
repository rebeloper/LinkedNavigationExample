//
//  HomeFirstView.swift
//  LinkedNavigationExample
//
//  Created by Alex Nagy on 17.11.2021.
//

import SwiftUI
import Dot

struct HomeFirstView: View {
    
    @EnvironmentObject private var homeContainerNavigation: HomeContainer.Navigation
    
    @EnvironmentObject private var toastManager: ToastManager
    
    var body: some View {
        VStack {
            Button {
                pushHomeSecondView()
            } label: {
                Text("Push HomeSecondView")
            }
            
            Button {
                presentHomeSecondView()
            } label: {
                Text("Present HomeSecondView")
            }
            
            Button {
                pop()
            } label: {
                Text("Pop")
            }
            
            Button {
                showToast()
            } label: {
                Text("Show Toast")
            }

        }
        .navigationTitle("Home First")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension HomeFirstView {
    func pushHomeSecondView() {
        $homeContainerNavigation.flow.present(.homeSecond)
    }
    
    func presentHomeSecondView() {
        $homeContainerNavigation.flow.present(.homeSecond, options: .init(style: .sheet, onDismiss: {
            print("Home Second View dismissed")
        })) {
            print("Navigation completed")
        }
    }
    
    func pop() {
        $homeContainerNavigation.flow.pop()
    }
    
    func showToast() {
        
        Task {
            do {
                try await Toast.presentThrowing("Title", message: "Hello", showsErrorNotice: true, with: toastManager, action: {
                    await AsyncWait.for(.milliseconds(1600))
                    throw CustomError.with(description: "err", code: 0)
                })
            } catch {
                print(error.localizedDescription)
            }
            
        }
    
//        Toast.present("Working...", message: "Message", with: toastManager) { done in
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                done(.success(true))
//            }
//        }
    }
    
}
