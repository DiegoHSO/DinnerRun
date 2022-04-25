//
//  MenuView.swift
//  Dinner Run
//
//  Created by Diego Henrique on 19/04/22.
//

import SwiftUI

struct MenuView: View {
    // MARK: - Variables And Properties
    @State private var isShowingNextView = false
    
    // MARK: - View
    // Main menu view
    
    var body: some View {
        NavigationView {
            VStack {
                Image("title")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.5058, height: UIScreen.main.bounds.height * 0.1152)
                    .padding()
                NavigationLink(destination: MainView(), isActive: $isShowingNextView) { EmptyView() }
                Button(action: {
                    isShowingNextView = true
                }) {
                    Image("startButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.2613, height: UIScreen.main.bounds.height * 0.1943)
                }
                
                Image("MenuCover")
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.5927)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .background(Color("backgroundBlue"))
        }
        .navigationViewStyle(.stack)
    }
}

