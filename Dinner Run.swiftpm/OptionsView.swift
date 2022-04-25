//
//  OptionsView.swift
//  Dinner Run
//
//  Created by Diego Henrique on 21/04/22.
//

import SwiftUI

struct OptionsView: View {
    // MARK: - Variables And Properties
    @ObservedObject var data: SupportData
    
    // MARK: - View
    // Shows solution options
    
    var body: some View {
        // Shows all 3 solution options
        VStack {
            Button {
                withAnimation(.easeOut(duration: 1)) {
                    data.dialogue = 3
                    data.isShowingDialogue.toggle()
                }
            } label: {
                Image("onceATimeButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.41762, height: UIScreen.main.bounds.height * 0.1357)
            }
            
            Button {
                withAnimation(.easeOut(duration: 1)) {
                    data.dialogue = 6
                    data.isShowingDialogue.toggle()
                }
            } label: {
                Image("mutexButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.41762, height: UIScreen.main.bounds.height * 0.1357)
            }
            
            Button {
                withAnimation(.easeOut(duration: 1)) {
                    data.dialogue = 9
                    data.isShowingDialogue.toggle()
                }
            } label: {
                Image("starvationSolutionButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.41762, height: UIScreen.main.bounds.height * 0.1357)
            }
        }
        .padding(EdgeInsets(top: 141, leading: 609, bottom: 494, trailing: 67))
        .disabled(data.dialogue != 2 ? true : false)
        .opacity(data.dialogue == 2 && data.isShowingDialogue ? 1 : 0)
        
        // Shows 2 solution options (only if least concurrent solution was done)
        VStack {
            Button {
                withAnimation(.easeOut(duration: 1)) {
                    data.dialogue = 6
                    data.isShowingDialogue.toggle()
                }
            } label: {
                Image("mutexButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.41762, height: UIScreen.main.bounds.height * 0.1357)
            }
            
            Button {
                withAnimation(.easeOut(duration: 1)) {
                    data.dialogue = 9
                    data.isShowingDialogue.toggle()
                }
            } label: {
                Image("starvationSolutionButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.41762, height: UIScreen.main.bounds.height * 0.1357)
            }
        }
        .padding(EdgeInsets(top: 181, leading: 609, bottom: 568, trailing: 67))
        .disabled(data.dialogue != 5 && !data.solutionsDone[0] && data.solutionsDone[1] ? true : false)
        .opacity(data.dialogue == 5 && data.isShowingDialogue && data.solutionsDone[0] && !data.solutionsDone[1] ? 1 : 0)
        
        // Shows 2 solution options (only if starvation scenario solution was done)
        VStack {
            Button {
                withAnimation(.easeOut(duration: 1)) {
                    data.dialogue = 3
                    data.isShowingDialogue.toggle()
                }
            } label: {
                Image("onceATimeButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.41762, height: UIScreen.main.bounds.height * 0.1357)
            }
            
            Button {
                withAnimation(.easeOut(duration: 1)) {
                    data.dialogue = 9
                    data.isShowingDialogue.toggle()
                }
            } label: {
                Image("starvationSolutionButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.41762, height: UIScreen.main.bounds.height * 0.1357)
            }
        }
        .padding(EdgeInsets(top: 181, leading: 609, bottom: 568, trailing: 67))
        .disabled(data.dialogue != 8 && data.solutionsDone[0] && !data.solutionsDone[1] ? true : false)
        .opacity(data.dialogue == 8 && data.isShowingDialogue && !data.solutionsDone[0] && data.solutionsDone[1] ? 1 : 0)
        
        // Shows last and right solution option
        Button {
            withAnimation(.easeOut(duration: 1)) {
                data.dialogue = 9
                data.isShowingDialogue.toggle()
            }
        } label: {
            Image("starvationSolutionButton")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.41762, height: UIScreen.main.bounds.height * 0.1357)
        }
        .padding(EdgeInsets(top: 255, leading: 612, bottom: 634, trailing: 67))
        .disabled(data.dialogue != 8 && !data.solutionsDone[0] && !data.solutionsDone[1] ? true : false)
        .opacity((data.dialogue == 8 || data.dialogue == 5) && data.isShowingDialogue && data.solutionsDone[0] && data.solutionsDone[1] && !data.solutionsDone[2] ? 1 : 0)
    }
}



