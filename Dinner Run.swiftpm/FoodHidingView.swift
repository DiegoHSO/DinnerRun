//
//  FoodHidingView.swift
//  Dinner Run
//
//  Created by Diego Henrique on 20/04/22.
//

import SwiftUI

struct FoodHidingView: View {
    
    // MARK: - Variables And Properties
    @ObservedObject var data: SupportData
    
    // MARK: - View
    // Hides the food from the plates
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 75, height: 75)
                .padding(EdgeInsets(top: 337, leading: 687, bottom: 612, trailing: 604))
                .opacity(!data.isShowingDialogue && data.isHidingFood[0] ? 1 : 0)
                .animation(Animation.easeOut.delay(data.dialogue == 0 ? 1.5 : data.dialogue == 3 ? 1 : (data.dialogue == 6 || data.dialogue == 9) ? 1.5 : 1.5), value: data.isHidingFood[0])
            
            Circle()
                .fill(Color.white)
                .frame(width: 75, height: 75)
                .padding(EdgeInsets(top: 401, leading: 393, bottom: 548, trailing: 898))
                .opacity(!data.isShowingDialogue && data.isHidingFood[1] ? 1 : 0)
                .animation(Animation.easeOut.delay(data.dialogue == 0 ? 3.5 : data.dialogue == 3 ? 1 : (data.dialogue == 6 || data.dialogue == 9) ? 1.5 : 3), value: data.isHidingFood[1])
            
            Circle()
                .fill(Color.white)
                .frame(width: 75, height: 75)
                .padding(EdgeInsets(top: 618, leading: 491, bottom: 331, trailing: 800))
                .opacity(!data.isShowingDialogue && data.isHidingFood[2] ? 1 : 0)
                .animation(Animation.easeOut.delay(data.dialogue == 0 ? 5.5 : data.dialogue == 3 ? 1 : (data.dialogue == 6 || data.dialogue == 9) ? 1.5 : 5.5), value: data.isHidingFood[2])
            
            Circle()
                .fill(Color.white)
                .frame(width: 75, height: 75)
                .padding(EdgeInsets(top: 618, leading: 803, bottom: 331, trailing: 488))
                .opacity(!data.isShowingDialogue && data.isHidingFood[3] ? 1 : 0)
                .animation(Animation.easeOut.delay(data.dialogue == 0 ? 7.5 : data.dialogue == 3 ? 1 : (data.dialogue == 6 || data.dialogue == 9) ? 1.5 : 7.5), value: data.isHidingFood[3])
            
            Circle()
                .fill(Color.white)
                .frame(width: 75, height: 75)
                .padding(EdgeInsets(top: 401, leading: 932, bottom: 548, trailing: 359))
                .opacity(!data.isShowingDialogue && data.isHidingFood[4] ? 1 : 0)
                .animation(Animation.easeOut.delay(data.dialogue == 0 ? 9.5 : data.dialogue == 3 ? 1 : (data.dialogue == 6 || data.dialogue == 9) ? 1.5 : 9.5), value: data.isHidingFood[4])
        }
    }
}

