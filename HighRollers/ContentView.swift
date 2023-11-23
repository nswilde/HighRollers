//
//  ContentView.swift
//  HighRollers
//
//  Created by Nikki Wilde on 22/11/23.
//

import SwiftUI


struct ContentView: View {
    let diceOptions = [4, 6, 8, 10, 12, 20, 100]
    @State private var diceSides = 6
    @State private var rollResult = 0
    @State private var rollAmount = 1
    @State private var showingResult = false
    
    init(diceSides: Int = 6, rollResult: Int) {
        self.diceSides = diceSides
        self.rollResult = rollResult
    }
    
    
    var body: some View {
        VStack {
            List {
                Section {
                    Picker("Dice type", selection: $diceSides) {
                        ForEach(diceOptions, id: \.self) { dice in
                            Text("\(dice) Sided")
                        }
                    }
                    
                    Picker("Rolls count", selection: $rollAmount) {
                        ForEach(0..<100) { count in
                            Text("\(count) times")
                        }
                    }
                }
                
                if showingResult {
                    Section {
                        HStack {
                            Text("\(rollResult)")
                        }
                    }
                }
            }
        }
        
        VStack {
            Button {
                diceRoll()
            } label: {
                Text("Roll the Dice!")
                Image(systemName: "dice.fill")
            }
            
            Button("Debug") {
                print(diceSides)
                print(rollAmount)
            }
        }
    }
    
    func diceRoll() {
        rollResult = rollDice()
        showingResult = true
    }
    
    func rollDice() -> Int {
        return Int.random(in: 1..<diceSides)
    }
    
    func saveRoll(id: UUID, result: Int) {
        
        let newdice = Result(id: UUID(), result: rollResult)
            
        } else {
            return
        }
    }
}

#Preview {
    ContentView(rollResult: 1)
}
