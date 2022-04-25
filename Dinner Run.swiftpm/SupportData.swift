//
//  Data.swift
//  Dinner Run
//
//  Created by Diego Henrique on 21/04/22.
//

import SwiftUI

// MARK: - Philosopher States

enum States: String, CaseIterable {
    case isThinking = "",
         isHungry = "  I'm hungry! 😋",
         isEating = "  I'm eating! 🥣",
         isWithLeftFork = "  I have the fork\n   from the left!",
         isWithRightFork = "  I have the fork\n  from the right!",
         isWithBothForks = "      I have\n both forks!"
}

class SupportData: ObservableObject {
    
    // MARK: - Variables And Properties
    
    @Published var dialogue: Int
    @Published var dialogues: [[String]] = []
    @Published var solutionsDone: [Bool] = [false, false, false]
    @Published var isHidingFood: [Bool] = [false, false, false, false, false]
    @Published var isHidingForks: [Bool] = [false, false, false, false, false]
    @Published var philosophersStates: [States] = [.isWithRightFork, .isWithRightFork, .isWithRightFork, .isWithRightFork, .isWithRightFork]
    @Published var isShowingDialogue: Bool = true
    
    // MARK: - Dialogues
    
    init() {
        dialogue = 0
        dialogues.append(["Hi! I'm Roland.", "I'm on a dinner with my friends and we're", "having trouble to eat our spaghetti. Each one", "of us need to have two forks to eat it. The", "problem is: we only have five forks for five", "people. Since we are hungry, we want to eat right", "away. Let me show you what is happening!"])
        dialogues.append(["As you could see, any of us could", "eat. We all took and held the forks from our", "right and didn't give back to the table. That", "made us hungry forever. We discovered", "that scientists may call this situation", "a deadlock, but we just want to eat! Can", "you help us? Please, choose an option", "that may solve our problem:"])
        dialogues.append(["", "", "", "", "", "", "", "", "", ""])
        dialogues.append(["", "", "", "", "", "", "", "", "", ""])
        dialogues.append(["Well, all of us could eat, but it took a long", "time until the last of us finished eating. I bet", "the food from the last one was cold already 😳", "We also discovered that this solution is not", "concurrent, according to scientists. So, maybe", "there is a better solution, don't you think?", "Let's see:"])
        dialogues.append(["", "", "", "", "", "", "", "", "", ""])
        dialogues.append(["", "", "", "", "", "", "", "", "", ""])
        dialogues.append(["In this solution we could see that many", "of us ate, and some ate even twice. The", "problem is that my friend with the crown", "could not eat because of the others that", "ate more than once, and he was not fast enough", "to get both forks. We learned that this situation", "is often called scientifically by starvation. We still", "have one or more solutions to help:"])
        dialogues.append(["", "", "", "", "", "", "", "", "", ""])
        dialogues.append(["", "", "", "", "", "", "", "", "", ""])
        dialogues.append(["Yay! This solution seems the best one.", "We learned to be more polite with each other,", "giving the preference for the ones which had not", "eat yet, so we could eat again. We can notice", "that this solution also saved us from deadlock and", "starvation, since all of us could eat and nobody", "starved. Thanks a lot for the help! ☺️"])
        dialogues.append(["", "", "", "", "", "", "", "", "", ""])
    }
    
    // MARK: - Solutions
    
    func doDeadlockScenario() {
        self.isHidingForks = [true, true, true, true, true]
        DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
            withAnimation(.easeOut(duration: 1)) {
                self.isShowingDialogue.toggle()
                self.dialogue += 1
                self.self.isHidingForks = [false, false, false, false, false]
            }
        }
    }
    
    func doLeastConcurrentSolution() {
        self.isHidingForks = [true, false, false, false, true]
        self.philosophersStates = [.isWithRightFork, .isThinking, .isThinking, .isThinking, .isThinking]
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, false, false, false, true]
                self.philosophersStates = [.isWithBothForks, .isThinking, .isThinking, .isThinking, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, false, false, false, false]
                self.isHidingFood = [true, false, false, false, false]
                self.philosophersStates = [.isEating, .isHungry, .isThinking, .isThinking, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, true, false, false, false]
                self.isHidingFood = [true, false, false, false, false]
                self.philosophersStates = [.isThinking, .isWithLeftFork, .isThinking, .isThinking, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, true, false, false, false]
                self.isHidingFood = [true, false, false, false, false]
                self.philosophersStates = [.isThinking, .isWithBothForks, .isThinking, .isThinking, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, true, false, false, false]
                self.isHidingFood = [true, true, false, false, false]
                self.philosophersStates = [.isThinking, .isEating, .isHungry, .isThinking, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 14) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, false, true, true, false]
                self.isHidingFood = [true, true, false, false, false]
                self.philosophersStates = [.isThinking, .isThinking, .isWithLeftFork, .isThinking, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 16) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, false, true, true, false]
                self.isHidingFood = [true, true, false, false, false]
                self.philosophersStates = [.isThinking, .isThinking, .isWithBothForks, .isThinking, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 19) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, true, true, true, false]
                self.isHidingFood = [true, true, false, true, false]
                self.philosophersStates = [.isThinking, .isThinking, .isEating, .isHungry, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 21.5) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, true, false, false, false]
                self.isHidingFood = [true, true, false, true, false]
                self.philosophersStates = [.isThinking, .isThinking, .isThinking, .isWithLeftFork, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 24.5) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, true, false, true, false]
                self.isHidingFood = [true, true, false, true, false]
                self.philosophersStates = [.isThinking, .isThinking, .isThinking, .isWithBothForks, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 28) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, true, false, true, false]
                self.isHidingFood = [true, true, true, true, false]
                self.philosophersStates = [.isThinking, .isThinking, .isThinking, .isEating, .isHungry]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 31.5) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, false, false, false, true]
                self.isHidingFood = [true, true, true, true, false]
                self.philosophersStates = [.isThinking, .isThinking, .isThinking, .isThinking, .isWithRightFork]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 35.5) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, false, true, false, true]
                self.isHidingFood = [true, true, true, true, false]
                self.philosophersStates = [.isThinking, .isThinking, .isThinking, .isThinking, .isWithBothForks]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 40.5) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingFood = [true, true, true, true, true]
                self.philosophersStates = [.isThinking, .isThinking, .isThinking, .isThinking, .isEating]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 46) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, false, false, false, false]
                self.isHidingFood = [false, false, false, false, false]
                self.philosophersStates = [.isThinking, .isThinking, .isThinking, .isThinking, .isThinking]
                self.solutionsDone[0] = true
                self.dialogue = 4
                self.isShowingDialogue.toggle()
            }
        }
    }
    
    func doStarvationScenarioSolution() {
        self.isHidingForks = [false, false, false, false, false]
        self.philosophersStates = [.isHungry, .isHungry, .isThinking, .isHungry, .isThinking]
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, true, false, false, false]
                self.philosophersStates = [.isWithRightFork, .isWithRightFork, .isThinking, .isHungry, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, false, false, true, true]
                self.philosophersStates = [.isWithBothForks, .isHungry, .isThinking, .isWithRightFork, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, true, false, true, true]
                self.isHidingFood = [true, false, false, false, false]
                self.philosophersStates = [.isEating, .isHungry, .isThinking, .isWithBothForks, .isHungry]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, true, true, true, false]
                self.isHidingFood = [true, false, true, false, false]
                self.philosophersStates = [.isHungry, .isHungry, .isThinking, .isEating, .isWithLeftFork]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, false, true, false, true]
                self.philosophersStates = [.isHungry, .isHungry, .isThinking, .isThinking, .isWithBothForks]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 18) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, false, true, false, true]
                self.isHidingFood = [true, false, true, false, true]
                self.philosophersStates = [.isHungry, .isHungry, .isHungry, .isThinking, .isEating]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 21) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, false, false, true, false]
                self.isHidingFood = [true, false, true, false, true]
                self.philosophersStates = [.isHungry, .isHungry, .isWithLeftFork, .isThinking, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 24) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, false, true, true, false]
                self.isHidingFood = [true, false, true, false, true]
                self.philosophersStates = [.isWithRightFork, .isHungry, .isWithBothForks, .isHungry, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 27) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, false, false, false, true]
                self.isHidingFood = [false, false, true, true, true]
                self.philosophersStates = [.isWithBothForks, .isHungry, .isEating, .isHungry, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, true, false, false, false]
                self.isHidingFood = [true, false, false, true, true]
                self.philosophersStates = [.isEating, .isHungry, .isThinking, .isWithLeftFork, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 33) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, true, false, true, false]
                self.isHidingFood = [true, false, false, true, true]
                self.philosophersStates = [.isThinking, .isHungry, .isThinking, .isWithBothForks, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 36) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, true, false, true, false]
                self.isHidingFood = [true, false, true, true, true]
                self.philosophersStates = [.isThinking, .isWithLeftFork, .isThinking, .isEating, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 39) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, false, false, false, false]
                self.isHidingFood = [true, false, true, true, true]
                self.philosophersStates = [.isThinking, .isHungry, .isThinking, .isThinking, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 45) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, false, false, false, false]
                self.isHidingFood = [false, false, false, false, false]
                self.philosophersStates = [.isThinking, .isThinking, .isThinking, .isThinking, .isThinking]
                self.solutionsDone[1] = true
                self.dialogue = 7
                self.isShowingDialogue.toggle()
            }
        }
    }
    
    func doBestSolution() {
        self.isHidingForks = [false, false, false, false, false]
        self.philosophersStates = [.isHungry, .isThinking, .isHungry, .isHungry, .isHungry]
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, true, false, false, true]
                self.philosophersStates = [.isWithRightFork, .isThinking, .isHungry, .isWithLeftFork, .isWithRightFork]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, true, true, true, true]
                self.philosophersStates = [.isWithRightFork, .isThinking, .isHungry, .isWithBothForks, .isWithBothForks]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, true, true, true, true]
                self.isHidingFood = [false, false, true, false, true]
                self.philosophersStates = [.isHungry, .isThinking, .isHungry, .isEating, .isEating]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, false, false, false, false]
                self.isHidingFood = [false, false, true, false, true]
                self.philosophersStates = [.isHungry, .isThinking, .isHungry, .isHungry, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, false, false, true, false]
                self.isHidingFood = [false, false, true, false, true]
                self.philosophersStates = [.isWithRightFork, .isHungry, .isWithLeftFork, .isHungry, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 18) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, false, true, true, true]
                self.isHidingFood = [false, false, true, false, true]
                self.philosophersStates = [.isWithBothForks, .isHungry, .isWithBothForks, .isHungry, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 21) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, false, true, true, true]
                self.isHidingFood = [true, false, true, true, true]
                self.philosophersStates = [.isEating, .isHungry, .isEating, .isHungry, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 24) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, false, false, false, false]
                self.isHidingFood = [true, false, true, true, true]
                self.philosophersStates = [.isThinking, .isHungry, .isThinking, .isHungry, .isHungry]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 27) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, false, false, false, false]
                self.isHidingFood = [true, false, true, true, true]
                self.philosophersStates = [.isThinking, .isWithLeftFork, .isThinking, .isHungry, .isHungry]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, true, false, false, false]
                self.isHidingFood = [true, false, true, true, true]
                self.philosophersStates = [.isThinking, .isWithBothForks, .isThinking, .isHungry, .isHungry]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 33) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, true, false, false, false]
                self.philosophersStates = [.isThinking, .isEating, .isThinking, .isHungry, .isHungry]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 36) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [true, true, false, true, true]
                self.isHidingFood = [true, true, true, true, true]
                self.philosophersStates = [.isThinking, .isEating, .isThinking, .isWithRightFork, .isWithRightFork]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 39) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, false, true, true, true]
                self.isHidingFood = [true, true, false, true, false]
                self.philosophersStates = [.isThinking, .isThinking, .isThinking, .isWithRightFork, .isWithBothForks]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 43) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, false, true, true, true]
                self.philosophersStates = [.isThinking, .isThinking, .isThinking, .isWithRightFork, .isEating]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 46) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, true, false, true, false]
                self.isHidingFood = [true, true, false, true, true]
                self.philosophersStates = [.isThinking, .isThinking, .isThinking, .isWithBothForks, .isEating]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 50) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, true, false, true, false]
                self.philosophersStates = [.isThinking, .isThinking, .isThinking, .isEating, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 52) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, false, false, false, false]
                self.isHidingFood = [true, true, true, true, true]
                self.philosophersStates = [.isThinking, .isThinking, .isThinking, .isEating, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 55) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, false, false, false, false]
                self.isHidingFood = [true, true, true, true, true]
                self.philosophersStates = [.isThinking, .isThinking, .isThinking, .isThinking, .isThinking]
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 55) {
            withAnimation(.easeOut(duration: 1)) {
                self.isHidingForks = [false, false, false, false, false]
                self.isHidingFood = [true, true, true, true, true]
                self.solutionsDone[2] = true
                self.dialogue = 10
                self.isShowingDialogue.toggle()
            }
        }
    }
    
}

