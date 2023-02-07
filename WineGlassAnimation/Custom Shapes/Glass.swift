//
//  Glass.swift
//  WineGlassAnimation
//
//  Created by Angelina Shamanova on 7.2.23..
//

import SwiftUI

struct Glass: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + 100))
        path.addCurve(to: CGPoint(x: rect.minX + 100, y: rect.minY + 100),
                      control1: CGPoint(x: rect.minX, y: rect.minY + 150),
                      control2: CGPoint(x: rect.minX + 100, y: rect.minY + 150))
        path.addLine(to: CGPoint(x: rect.minX + 100, y: rect.minY + 100))
        path.addLine(to: CGPoint(x: rect.minX + 100, y: rect.minY))
        return path
    }
}
