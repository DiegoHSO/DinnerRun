//
//  MainView.swift
//  Dinner Run
//
//  Created by Diego Henrique on 20/04/22.
//

import SwiftUI

struct MainView: View {
    // MARK: - Variables And Properties
    @StateObject var data: SupportData = SupportData()
    
    // MARK: - View
    // Start point after passing from main menu
    var body: some View {
        ZStack {
            PhilosophersTableView(data: data)
            DialoguesView(data: data)
        }
        .navigationBarHidden(true)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
        .background(Color("backgroundBlue"))
    }
}
