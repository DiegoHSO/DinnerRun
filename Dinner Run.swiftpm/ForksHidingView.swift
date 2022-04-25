//
//  ForksHidingView.swift
//  Dinner Run
//
//  Created by Diego Henrique on 20/04/22.
//

import SwiftUI

struct ForksHidingView: View {
    
    // MARK: - Variables And Properties
    @ObservedObject var data: SupportData
    
    // MARK: - View
    // Hides the forks from the table
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("tableColor"))
                .frame(width: 120, height: 110)
                .padding(EdgeInsets(top: 338, leading: 529, bottom: 572, trailing: 723))
                .opacity(!data.isShowingDialogue && data.isHidingForks[0] ? 1 : 0)
                .animation(Animation.easeOut.delay(data.dialogue == 0 ? 1.5 : data.dialogue == 3 ? 1.5 : 1.5), value: data.isHidingForks[0])
            
            Rectangle()
                .fill(Color("tableColor"))
                .frame(width: 130, height: 80)
                .padding(EdgeInsets(top: 503, leading: 362, bottom: 410, trailing: 871))
                .opacity(!data.isShowingDialogue && data.isHidingForks[1] ? 1 : 0)
                .animation(Animation.easeOut.delay((data.dialogue == 6 || data.dialogue == 9) ? 1.5 : 3.5), value: data.isHidingForks[1])
            
            Rectangle()
                .fill(Color("tableColor"))
                .frame(width: 130, height: 90)
                .padding(EdgeInsets(top: 527, leading: 913, bottom: 383, trailing: 340))
                .opacity(!data.isShowingDialogue && data.isHidingForks[2] ? 1 : 0)
                .animation(Animation.easeOut.delay(data.dialogue == 0 ? 5.5 : data.dialogue == 3 ? 2.5 : (data.dialogue == 6 || data.dialogue == 9) ? 1.5 : 2.5), value: data.isHidingForks[2])
            
            Rectangle()
                .fill(Color("tableColor"))
                .frame(width: 130, height: 140)
                .padding(EdgeInsets(top: 527, leading: 913, bottom: 200, trailing: 913))
                .opacity(!data.isShowingDialogue && data.isHidingForks[3] ? 1 : 0)
                .animation(Animation.easeOut.delay(data.dialogue == 0 ? 7.5 : data.dialogue == 3 ? 1.5 : (data.dialogue == 6 || data.dialogue == 9) ? 1.5 : 2.5), value: data.isHidingForks[3])
            
            Rectangle()
                .fill(Color("tableColor"))
                .frame(width: 110, height: 125)
                .padding(EdgeInsets(top: 340, leading: 784, bottom: 556, trailing: 454))
                .opacity(!data.isShowingDialogue && data.isHidingForks[4] ? 1 : 0)
                .animation(Animation.easeOut.delay(data.dialogue == 0 ? 9.5 : data.dialogue == 3 ? 3.5 : (data.dialogue == 6 || data.dialogue == 9) ? 1.5 : 3.5), value: data.isHidingForks[4])
        }
    }
}
