//
//  Pie.swift
//  StanfordCS193.2023
//
//  Created by Alam Alonzo on 2/9/24.
//


//Make your OWN Shape
import SwiftUI
import CoreGraphics

struct Pie: Shape {
    // puedes degrees or radians
    var startAngle: Angle = Angle.degrees(0)
    let endAngle: Angle
    var clockwise = true
    
    func path(in rect: CGRect) -> Path {
        let startAngle = startAngle - .degrees(90)
        let endAngle = endAngle - . degrees(90)
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(startAngle.radians),
            y: center.y + radius * sin(startAngle.radians)
            )
        
        //start point for the shape
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        
        p.addArc(center: center,
                 radius: radius,
                 startAngle: startAngle,
                 endAngle: endAngle,
                 clockwise: !clockwise)
        p.addLine(to: center)
        
        return p
    }
    
    
}
