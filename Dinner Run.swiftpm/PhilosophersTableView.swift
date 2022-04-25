//
//  PhilosophersTableView.swift
//  Dinner Run
//
//  Created by Diego Henrique on 20/04/22.
//

import SwiftUI

struct PhilosophersTableView: View {
    // MARK: - Variables And Properties
    
    @ObservedObject var data: SupportData

    // MARK: - View
    // Shows the table with Philosophers and solutions
    
    var body: some View {
        ZStack {
            Image("tableWithPhilosophers")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.8294, height: UIScreen.main.bounds.height * 0.7832)
                .padding()
            
            PhilosophersStateView(data: data)
            ForksHidingView(data: data)
            FoodHidingView(data: data)
        }
        .opacity(data.isShowingDialogue && (data.dialogue == 0 || data.dialogue == 11) ? 0 : data.isShowingDialogue && (data.dialogue > 0 && data.dialogue != 11) ? 0.2 : 1)
        .onChange(of: data.isShowingDialogue) { _ in
            if (!data.isShowingDialogue && data.dialogue == 0) {
                data.doDeadlockScenario()
            }
            if (!data.isShowingDialogue && data.dialogue == 3) {
                data.doLeastConcurrentSolution()
            }
            if (!data.isShowingDialogue && data.dialogue == 6) {
                data.doStarvationScenarioSolution()
            }
            if (!data.isShowingDialogue && data.dialogue == 9) {
                data.doBestSolution()
            }
            
        }
    }
}
