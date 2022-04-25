//
//  DialoguesView.swift
//  Dinner Run
//
//  Created by Diego Henrique on 20/04/22.
//

import SwiftUI

struct DialoguesView: View {
    
    // MARK: - Variables And Properties
    @ObservedObject var data: SupportData
    
    // MARK: - View
    // Shows the dialogues from Roland
    
    var body: some View {
        ZStack {
            HStack {
                Image("yellowPhilosopher")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.4311, height: UIScreen.main.bounds.height * 0.6162)
                    .padding(EdgeInsets(top: 400, leading: 6, bottom: 0, trailing: 0))
                
                ZStack {
                    Image("leftDialogueBox")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.5797, height: UIScreen.main.bounds.height * 0.7304)
                        .padding(EdgeInsets(top: 45, leading: 0, bottom: 251, trailing: 50))
                    TextView(data: data, lines: data.dialogues[data.dialogue])
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 400, trailing: 50))
                    
                    Button {
                        withAnimation(.easeOut(duration: 1)) {
                            switch data.dialogue {
                            case 0:
                                data.isShowingDialogue.toggle()
                                break
                            case 1:
                                data.dialogue = 2
                                break
                            case 4:
                                data.dialogue = 5
                                break
                            case 7:
                                data.dialogue = 8
                                break
                            case 10:
                                data.dialogue = 11
                                break
                            default:
                                data.isShowingDialogue.toggle()
                                break
                            }
                            
                        }
                    } label: {
                        Image("nextButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.2562, height: UIScreen.main.bounds.height * 0.1835)
                            .padding(EdgeInsets(top: 700, leading: 300, bottom: 0, trailing: 0))
                    }
                    .disabled(data.dialogue == 2 || data.dialogue == 5 || data.dialogue == 11 ? true : false)
                    .opacity(data.dialogue == 2 || data.dialogue == 5 || data.dialogue == 8 ? 0 : 1)
                    
                }
            }
            .opacity(data.isShowingDialogue && data.dialogue != 11 ? 1 : 0)
            .onChange(of: data.dialogue) { _ in
                if data.dialogue == 1 {
                    
                }
            }
            
            OptionsView(data: data)
            CreditsView(data: data)
        }
    }
}

