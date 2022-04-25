//
//  CreditsView.swift
//  Dinner Run
//
//  Created by Diego Henrique on 22/04/22.
//

import SwiftUI

struct CreditsView: View {
    
    // MARK: - Variables And Properties
    @ObservedObject var data: SupportData
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    // MARK: - View
    // Shows the final credits.
    
    var body: some View {
        VStack {
            Image("Credits")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.92, height: UIScreen.main.bounds.height * 0.646)
            
            Button {
                withAnimation(.easeOut(duration: 1)) {
                    data.dialogue = 0
                    data.solutionsDone = [false, false, false]
                    self.mode.wrappedValue.dismiss()
                }
            } label: {
                Image("backToMenuButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.2518, height: UIScreen.main.bounds.height * 0.1773)
            }
                
        }
        .padding(EdgeInsets(top: 96, leading: 54, bottom: 46, trailing: 54))
        .disabled(data.dialogue != 11 ? true : false)
        .opacity(data.dialogue != 11 ? 0 : 1)
    
    }
}
