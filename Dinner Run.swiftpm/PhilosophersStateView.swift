//
//  PhilosophersStateView.swift
//  Dinner Run
//
//  Created by Diego Henrique on 20/04/22.
//

import SwiftUI

struct PhilosophersStateView: View {
    
    // MARK: - Variables And Properties
    @ObservedObject var data: SupportData
    
    // MARK: - View
    // Shows dialogue boxes, texts and fork assets which indicate philosophers states visually
    
    var body: some View {
        ZStack {
            Image("leftDialogueBox")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.1295, height: UIScreen.main.bounds.height * 0.163)
                .padding(EdgeInsets(top: 51, leading: 792, bottom: 805, trailing: 397))
                .opacity(!data.isShowingDialogue && data.philosophersStates[0] != .isThinking ? 1 : 0)
                .scaleEffect(data.isShowingDialogue ? 0 : 1)
                .animation(Animation.spring().delay(data.dialogue == 0 ? 1 : data.dialogue == 3 ? 1 : 1), value: data.isShowingDialogue)
            
            Image("leftDialogueBox")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.1295, height: UIScreen.main.bounds.height * 0.163)
                .padding(EdgeInsets(top: 134, leading: 236, bottom: 723, trailing: 953))
                .opacity(!data.isShowingDialogue && data.philosophersStates[1] != .isThinking ? 1 : 0)
                .scaleEffect(data.isShowingDialogue ? 0 : 1)
                .animation(Animation.spring().delay(data.dialogue == 0 ? 3 : data.dialogue == 3 ? 7 : (data.dialogue == 6 || data.dialogue == 9) ? 1 : 3), value: data.isShowingDialogue)
            
            Image("leftDialogueBox")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.1295, height: UIScreen.main.bounds.height * 0.163)
                .padding(EdgeInsets(top: 732, leading: 944, bottom: 125, trailing: 245))
                .opacity(!data.isShowingDialogue && data.philosophersStates[2] != .isThinking ? 1 : 0)
                .scaleEffect(data.isShowingDialogue ? 0 : 1)
                .animation(Animation.spring().delay((data.dialogue == 6 || data.dialogue == 9) ? 1 : 5), value: data.isShowingDialogue)
            
            Image("rightDialogueBox")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.1295, height: UIScreen.main.bounds.height * 0.163)
                .padding(EdgeInsets(top: 731, leading: 227, bottom: 126, trailing: 962))
                .opacity(!data.isShowingDialogue && data.philosophersStates[3] != .isThinking ? 1 : 0)
                .scaleEffect(data.isShowingDialogue ? 0 : 1)
                .animation(Animation.spring().delay(data.dialogue == 0 ? 7 : data.dialogue == 3 ? 6 : (data.dialogue == 6 || data.dialogue == 9) ? 1 : 7), value: data.isShowingDialogue)
            
            Image("rightDialogueBox")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.1295, height: UIScreen.main.bounds.height * 0.163)
                .padding(EdgeInsets(top: 174, leading: 956, bottom: 683, trailing: 233))
                .opacity(!data.isShowingDialogue && data.philosophersStates[4] != .isThinking ? 1 : 0)
                .scaleEffect(data.isShowingDialogue ? 0 : 1)
                .animation(Animation.spring().delay((data.dialogue == 6 || data.dialogue == 9) ? 1 : 9), value: data.isShowingDialogue)
        }
        
        ZStack {
            Text(data.philosophersStates[0].rawValue)
                .font(.system(.headline))
                .shadow(color: .black, radius: 1)
                .padding(EdgeInsets(top: 51, leading: 792, bottom: 875, trailing: 407))
                .opacity(data.isShowingDialogue ? 0 : 1)
                .scaleEffect(data.isShowingDialogue ? 0 : 1)
                .animation(Animation.spring().delay(data.dialogue == 0 ? 1 : data.dialogue == 3 ? 1 : 1), value: data.isShowingDialogue)
            
            Text(data.philosophersStates[1].rawValue)
                .font(.system(.headline))
                .shadow(color: .black, radius: 1)
                .padding(EdgeInsets(top: 134, leading: 236, bottom: 793, trailing: 963))
                .opacity(data.isShowingDialogue ? 0 : 1)
                .scaleEffect(data.isShowingDialogue ? 0 : 1)
                .animation(Animation.spring().delay(data.dialogue == 0 ? 3 : data.dialogue == 3 ? 7 : (data.dialogue == 6 || data.dialogue == 9) ? 1 : 3), value: data.isShowingDialogue)
            
            Text(data.philosophersStates[2].rawValue)
                .font(.system(.headline))
                .shadow(color: .black, radius: 1)
                .padding(EdgeInsets(top: 732, leading: 944, bottom: 195, trailing: 255))
                .opacity(data.isShowingDialogue ? 0 : 1)
                .scaleEffect(data.isShowingDialogue ? 0 : 1)
                .animation(Animation.spring().delay((data.dialogue == 6 || data.dialogue == 9) ? 1 : 5), value: data.isShowingDialogue)
            
            Text(data.philosophersStates[3].rawValue)
                .font(.system(.headline))
                .shadow(color: .black, radius: 1)
                .padding(EdgeInsets(top: 731, leading: 227, bottom: 196, trailing: 972))
                .opacity(data.isShowingDialogue ? 0 : 1)
                .scaleEffect(data.isShowingDialogue ? 0 : 1)
                .animation(Animation.spring().delay(data.dialogue == 0 ? 7 : data.dialogue == 3 ? 6 : (data.dialogue == 6 || data.dialogue == 9) ? 1 : 7), value: data.isShowingDialogue)
            
            Text(data.philosophersStates[4].rawValue)
                .font(.system(.headline))
                .shadow(color: .black, radius: 1)
                .padding(EdgeInsets(top: 174, leading: 956, bottom: 743, trailing: 233))
                .opacity(data.isShowingDialogue ? 0 : 1)
                .scaleEffect(data.isShowingDialogue ? 0 : 1)
                .animation(Animation.spring().delay(data.dialogue == 0 ? 9 : data.dialogue == 3 ? 6 : (data.dialogue == 6 || data.dialogue == 9) ? 1 : 7), value: data.isShowingDialogue)
        }
        
        ZStack {
            HStack (spacing: 0) {
                Image("forkLittle")
                Image("forkLittle")
            }
            .padding(EdgeInsets(top: 51, leading: 792, bottom: 775, trailing: 407))
            .opacity(data.philosophersStates[0] == .isWithBothForks && !data.isShowingDialogue ? 1 : 0)
            .animation(Animation.spring().delay(1), value: data.isShowingDialogue)
            
            HStack (spacing: 0) {
                Image("forkLittle")
                Image("forkLittle")
            }
            .padding(EdgeInsets(top: 134, leading: 236, bottom: 693, trailing: 963))
            .opacity(data.philosophersStates[1] == .isWithBothForks && !data.isShowingDialogue ? 1 : 0)
            .animation(Animation.spring().delay(1), value: data.isShowingDialogue)
            
            HStack (spacing: 0) {
                Image("forkLittle")
                Image("forkLittle")
            }
            .padding(EdgeInsets(top: 732, leading: 944, bottom: 95, trailing: 255))
            .opacity(data.philosophersStates[2] == .isWithBothForks && !data.isShowingDialogue ? 1 : 0)
            .animation(Animation.spring().delay(1), value: data.isShowingDialogue)
            
            HStack (spacing: 0) {
                Image("forkLittle")
                Image("forkLittle")
            }
            .padding(EdgeInsets(top: 731, leading: 227, bottom: 96, trailing: 972))
            .opacity(data.philosophersStates[3] == .isWithBothForks && !data.isShowingDialogue ? 1 : 0)
            .animation(Animation.spring().delay(1), value: data.isShowingDialogue)
            
            HStack (spacing: 0) {
                Image("forkLittle")
                Image("forkLittle")
            }
            .padding(EdgeInsets(top: 174, leading: 956, bottom: 653, trailing: 233))
            .opacity(data.philosophersStates[4] == .isWithBothForks && !data.isShowingDialogue ? 1 : 0)
            .animation(Animation.spring().delay(1), value: data.isShowingDialogue)
        }
        
        ZStack {
            Image("forkLittle")
                .opacity((data.philosophersStates[0] == .isWithRightFork || data.philosophersStates[0] == .isWithLeftFork) && !data.isShowingDialogue ? 1 : 0)
                .padding(EdgeInsets(top: 51, leading: 792, bottom: 775, trailing: 407))
                .animation(Animation.spring().delay(1), value: data.isShowingDialogue)
            
            Image("forkLittle")
                .opacity((data.philosophersStates[1] == .isWithRightFork || data.philosophersStates[1] == .isWithLeftFork) && !data.isShowingDialogue ? 1 : 0)
                .padding(EdgeInsets(top: 134, leading: 236, bottom: 693, trailing: 963))
                .animation(Animation.spring().delay((data.dialogue == 6 || data.dialogue == 9) ? 1 : 3), value: data.isShowingDialogue)
            
            Image("forkLittle")
                .opacity((data.philosophersStates[2] == .isWithRightFork || data.philosophersStates[2] == .isWithLeftFork) && !data.isShowingDialogue ? 1 : 0)
                .padding(EdgeInsets(top: 732, leading: 944, bottom: 95, trailing: 255))
                .animation(Animation.spring().delay((data.dialogue == 6 || data.dialogue == 9) ? 1 : 5), value: data.isShowingDialogue)
            
            Image("forkLittle")
                .opacity((data.philosophersStates[3] == .isWithRightFork || data.philosophersStates[3] == .isWithLeftFork) && !data.isShowingDialogue ? 1 : 0)
                .padding(EdgeInsets(top: 731, leading: 227, bottom: 96, trailing: 972))
                .animation(Animation.spring().delay((data.dialogue == 6 || data.dialogue == 9) ? 1 : 7), value: data.isShowingDialogue)
            
            Image("forkLittle")
                .opacity((data.philosophersStates[4] == .isWithRightFork || data.philosophersStates[4] == .isWithLeftFork) && !data.isShowingDialogue ? 1 : 0)
                .padding(EdgeInsets(top: 174, leading: 956, bottom: 653, trailing: 233))
                .animation(Animation.spring().delay((data.dialogue == 6 || data.dialogue == 9) ? 1 : 9), value: data.isShowingDialogue)
        }
    }
    
}
