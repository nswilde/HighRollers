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
    @State private var rollResult: Int
    @State private var rollAmount = 1
    
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
                Section {
                    HStack {
                        Text("Results: \(rollResult)")
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
    }
    
    func rollDice() -> Int {
        return Int.random(in: 1..<diceSides)
    }
}

#Preview {
    ContentView(rollResult: 1)
}
