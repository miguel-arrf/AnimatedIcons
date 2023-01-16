//
//  ContentView.swift
//  AnimatedIcons
//
//  Created by Miguel Ferreira on 12/01/2023.
//

import SwiftUI

struct SwatchPalette: View {

    var width = 6.6
    var height = 6.6
    var offset = -5.0
    var lineWidth = 1.8
    var cornerRadius = 1.4
    var strokeColor : Color = .black
    var backgroundColor : Color = .white

    @State var secondLevelRotation = 54.0
    @State var firstLevelRotation = 24.0

    @State var firstLevelOpacity = 1.0
    @State var secondLevelOpacity = 1.0

    @State var hovering = false

    @Binding var animate : Bool


    var springyAnimation = Animation.interpolatingSpring(mass: 0.10, stiffness: 7.15, damping: 0.43, initialVelocity: 3.25)

    init(width: Double = 6.6, height: Double = 6.6, offset: Double = -5.0, lineWidth: Double = 1.8, cornerRadius: Double = 1.4, strokeColor: Color = .black, backgroundColor: Color = .white, secondLevelRotation: Double = 54.0, firstLevelRotation: Double = 24.0, firstLevelOpacity: Double = 1.0, secondLevelOpacity: Double = 1.0, hovering: Bool = false, springyAnimation: SwiftUI.Animation = Animation.interpolatingSpring(mass: 0.10, stiffness: 7.15, damping: 0.43, initialVelocity: 3.25), animate : Binding<Bool> = .constant(false)) {
        self.width = width
        self.height = height
        self.offset = offset
        self.lineWidth = lineWidth
        self.cornerRadius = cornerRadius
        self.strokeColor = strokeColor
        self.backgroundColor = backgroundColor
        self.secondLevelRotation = secondLevelRotation
        self.firstLevelRotation = firstLevelRotation
        self.firstLevelOpacity = firstLevelOpacity
        self.secondLevelOpacity = secondLevelOpacity
        self.hovering = hovering
        self._animate = animate
        self.springyAnimation = springyAnimation
    }

    var body: some View {
        VStack {
            ZStack {
                VStack(spacing: -1.5) {
                    ForEach(1..<4) { i in
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .strokeBorder(strokeColor,lineWidth: lineWidth)
                            .background(Circle().foregroundColor(backgroundColor))
                            .frame(width: width, height: height)
                            .offset(x: offset)
                    }
                }
                .scaleEffect(y: 0.8)
                .rotationEffect(Angle(degrees: secondLevelRotation), anchor: .bottomLeading)
                .offset(x: -1)
                .opacity(secondLevelOpacity)

                VStack(spacing: -1.5) {
                    ForEach(1..<4) { i in
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .strokeBorder(strokeColor,lineWidth: lineWidth)
                            .background(Circle().foregroundColor(backgroundColor))
                            .frame(width: width, height: height)
                            .offset(x: offset)
                    }

                }
                .scaleEffect(y: 0.9)
                .rotationEffect(Angle(degrees: firstLevelRotation), anchor: .bottomLeading)
                .offset(x: -0.2)
                .offset(y: -0.6)
                .opacity(firstLevelOpacity)


                VStack(spacing: -1.5) {
                    ForEach(1..<4) { i in
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .strokeBorder(strokeColor,lineWidth: lineWidth)
                            .background(Circle().foregroundColor(backgroundColor))
                            .frame(width: width, height: height)
                            .offset(x: offset)
                    }

                }

            }
            .onHover(perform: { hover in
                hovering = hover
                if hovering {
                    animation()
                }

            })
            .onChange(of: animate){ newValue in
                if newValue {
                    animation()
                }
            }

        }
    }

    func animation(){
        withAnimation(springyAnimation){
            firstLevelRotation = 10.0

            firstLevelOpacity = 0.6

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(springyAnimation.delay(0.2)){
                    firstLevelRotation = 24.0
                    firstLevelOpacity = 1.0
                }
            }
        }

        withAnimation(springyAnimation.delay(0.2)){
            secondLevelRotation = 20.0
            secondLevelOpacity = 0.6
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                withAnimation(springyAnimation.delay(0.2)){
                    secondLevelRotation = 54.0
                    secondLevelOpacity = 1.0
                }
            }
        }
    }

}

struct SwatchPalette_Previews: PreviewProvider {
    static var previews: some View {
        SwatchPalette()
    }
}


extension Shape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1) -> some View {
        self
            .stroke(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

extension InsettableShape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1) -> some View {
        self
            .strokeBorder(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}
