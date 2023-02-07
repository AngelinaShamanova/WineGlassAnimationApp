//
//  ContentView.swift
//  WineGlassAnimation
//
//  Created by Angelina Shamanova on 7.2.23..
//

import SwiftUI

struct ContentView: View {
    @State private var drinkPercentage = 66.0
    @State private var colorOfDrink: Color = .pink.opacity(0.6)
    @State private var colorOfGlass: Color = .white
    @State private var backgroundColor: Color = .black
    
    var body: some View {
        VStack {
            GlassView(drinkPercentage: $drinkPercentage,
                      colorOfDrink: $colorOfDrink,
                      colorOfGlass: $colorOfGlass,
                      backgroundColor: $backgroundColor)
            Slider(value: self.$drinkPercentage, in: 0...100)
                .tint(colorOfDrink)
                .padding(50)
        }
        .padding(.all)
        .ignoresSafeArea()
        .background(backgroundColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
