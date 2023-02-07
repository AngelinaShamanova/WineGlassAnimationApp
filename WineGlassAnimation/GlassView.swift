//
//  GlassView.swift
//  WineGlassAnimation
//
//  Created by Angelina Shamanova on 7.2.23..
//

import SwiftUI

struct GlassView: View {
    @Binding var drinkPercentage: Double
    @Binding var colorOfDrink: Color
    @Binding var colorOfGlass: Color
    @Binding var backgroundColor: Color
    @State private var waveOffset = Angle(degrees: 0)
    
    var body: some View {
        ZStack(alignment: .center) {
            backgroundColor.ignoresSafeArea()
            Circle()
                .fill(colorOfGlass)
                .rotation3DEffect(.degrees(87), axis: (x: 1, y: 0, z: 0))
                .frame(width: 85, alignment: .bottom)
                .offset(y: 50)
            RoundedRectangle(cornerRadius: 2)
                .fill(colorOfGlass)
                .frame(width: 6, height: 100)
            Glass()
                .fill(colorOfGlass)
                .overlay(
                    Wave(offset: Angle(degrees: self.waveOffset.degrees),
                         percent: Double(drinkPercentage)/100)
                    .fill(colorOfDrink)
                    .clipShape(Glass())
                )
                .frame(width: 100, height: 150)
                .offset(y: -100)
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
            }
        }
    }
}

struct GlassView_Previews: PreviewProvider {
    static var previews: some View {
        GlassView(drinkPercentage: .constant(66),
                  colorOfDrink: .constant(.pink.opacity(0.6)),
                  colorOfGlass: .constant(.white),
                  backgroundColor: .constant(.black))
    }
}
