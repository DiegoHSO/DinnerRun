//
//  TextView.swift
//  Dinner Run
//
//  Created by Diego Henrique on 20/04/22.
//

import SwiftUI

struct TextView: View {
    
    // MARK: - Variables And Properties
    
    @ObservedObject var data: SupportData
    @State private var isShowingNextView = false
    @State private var currentLineIndex: Int = -1
    var lines: [String] = []
    
    // MARK: - View
    // Shows text letter by letter while dialogue is happening
    var body: some View {
        
        VStack {
            ForEach(Array(lines.indices), id: \.self) { index in
                Text(lines[index])
                    .font(.system(.largeTitle))
                    .mask(Rectangle().offset(x: currentLineIndex < index ? -1000 : 0))
                    .shadow(color: .black, radius: 1)
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 1).delay(0.5)) {
                recursiveAnimation(isFirst: true)
            }
        }
        .onChange(of: data.dialogue) { _ in
            currentLineIndex = -1
            withAnimation(.easeOut(duration: 1).delay(0.5)) {
                recursiveAnimation(isFirst: true)
            }
        }
        
    
    }
    
    func recursiveAnimation(isFirst: Bool = false) {
        if currentLineIndex >= lines.count {
            return
        }
        
        currentLineIndex += 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + (isFirst ? 2 : 1)) {
            withAnimation(.easeOut(duration: 1)) {
                recursiveAnimation()
            }
        }
    }
}



