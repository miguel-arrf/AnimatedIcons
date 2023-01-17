//
//  ContentView.swift
//  AnimatedIcons
//
//  Created by Miguel Ferreira on 12/01/2023.
//

import SwiftUI

public struct SwatchPalette: View {

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

    public init(width: Double = 6.6, height: Double = 6.6, offset: Double = -5.0, lineWidth: Double = 1.8, cornerRadius: Double = 1.4, strokeColor: Color = .black, backgroundColor: Color = .white, secondLevelRotation: Double = 54.0, firstLevelRotation: Double = 24.0, firstLevelOpacity: Double = 1.0, secondLevelOpacity: Double = 1.0, hovering: Bool = false, springyAnimation: SwiftUI.Animation = Animation.interpolatingSpring(mass: 0.10, stiffness: 7.15, damping: 0.43, initialVelocity: 3.25), animate : Binding<Bool> = .constant(false)) {
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

    public var body: some View {
        VStack {
            ZStack {
                VerticalPalette()

                    .scaleEffect(y: 0.8)
                .rotationEffect(Angle(degrees: secondLevelRotation), anchor: .bottomLeading)
                .offset(x: -2, y: -1)
                .opacity(secondLevelOpacity)

                VerticalPalette()
                .scaleEffect(y: 0.9)
                .rotationEffect(Angle(degrees: firstLevelRotation), anchor: .bottomLeading)
                .offset(x: -0.2)
                .offset(y: -0.6)
                .opacity(firstLevelOpacity)


                //ExtractedView()

                VerticalPalette()


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
        HStack {
            Rectangle()
                .clipShape(RoundedCorners(tl: 0, tr:30, bl: 30, br: 0))
                .frame(width: 30, height: 30)
            SwatchPalette()
                .frame(width: 100, height: 100)

            Text(Image(systemName: "swatchpalette"))
                .fontWeight(.black)
                .foregroundColor(.black)
        }
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

struct VerticalPaletteShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.3208*width, y: 0.99349*height))
        path.addLine(to: CGPoint(x: 0.67155*width, y: 0.99349*height))
        path.addCurve(to: CGPoint(x: 0.87582*width, y: 0.95687*height), control1: CGPoint(x: 0.7589*width, y: 0.99349*height), control2: CGPoint(x: 0.82699*width, y: 0.98128*height))
        path.addCurve(to: CGPoint(x: 0.94906*width, y: 0.85677*height), control1: CGPoint(x: 0.92464*width, y: 0.93273*height), control2: CGPoint(x: 0.94906*width, y: 0.89936*height))
        path.addLine(to: CGPoint(x: 0.94906*width, y: 0.13737*height))
        path.addCurve(to: CGPoint(x: 0.87582*width, y: 0.03727*height), control1: CGPoint(x: 0.94906*width, y: 0.09478*height), control2: CGPoint(x: 0.92464*width, y: 0.06141*height))
        path.addCurve(to: CGPoint(x: 0.67155*width, y: 0.00106*height), control1: CGPoint(x: 0.82699*width, y: 0.01313*height), control2: CGPoint(x: 0.7589*width, y: 0.00106*height))
        path.addLine(to: CGPoint(x: 0.3208*width, y: 0.00106*height))
        path.addCurve(to: CGPoint(x: 0.11491*width, y: 0.03727*height), control1: CGPoint(x: 0.23291*width, y: 0.00106*height), control2: CGPoint(x: 0.16428*width, y: 0.01313*height))
        path.addCurve(to: CGPoint(x: 0.04085*width, y: 0.13737*height), control1: CGPoint(x: 0.06554*width, y: 0.06141*height), control2: CGPoint(x: 0.04085*width, y: 0.09478*height))
        path.addLine(to: CGPoint(x: 0.04085*width, y: 0.85677*height))
        path.addCurve(to: CGPoint(x: 0.11491*width, y: 0.95687*height), control1: CGPoint(x: 0.04085*width, y: 0.89936*height), control2: CGPoint(x: 0.06554*width, y: 0.93273*height))
        path.addCurve(to: CGPoint(x: 0.3208*width, y: 0.99349*height), control1: CGPoint(x: 0.16428*width, y: 0.98128*height), control2: CGPoint(x: 0.23291*width, y: 0.99349*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.32975*width, y: 0.87467*height))
        path.addCurve(to: CGPoint(x: 0.29313*width, y: 0.86735*height), control1: CGPoint(x: 0.3151*width, y: 0.87467*height), control2: CGPoint(x: 0.3029*width, y: 0.87223*height))
        path.addCurve(to: CGPoint(x: 0.27848*width, y: 0.84904*height), control1: CGPoint(x: 0.28337*width, y: 0.86274*height), control2: CGPoint(x: 0.27848*width, y: 0.85663*height))
        path.addLine(to: CGPoint(x: 0.27848*width, y: 0.1451*height))
        path.addCurve(to: CGPoint(x: 0.29313*width, y: 0.12679*height), control1: CGPoint(x: 0.27848*width, y: 0.13751*height), control2: CGPoint(x: 0.28337*width, y: 0.1314*height))
        path.addCurve(to: CGPoint(x: 0.32975*width, y: 0.11987*height), control1: CGPoint(x: 0.3029*width, y: 0.12218*height), control2: CGPoint(x: 0.3151*width, y: 0.11987*height))
        path.addLine(to: CGPoint(x: 0.6626*width, y: 0.11987*height))
        path.addCurve(to: CGPoint(x: 0.69759*width, y: 0.12679*height), control1: CGPoint(x: 0.6767*width, y: 0.11987*height), control2: CGPoint(x: 0.68837*width, y: 0.12218*height))
        path.addCurve(to: CGPoint(x: 0.71224*width, y: 0.1451*height), control1: CGPoint(x: 0.70736*width, y: 0.1314*height), control2: CGPoint(x: 0.71224*width, y: 0.13751*height))
        path.addLine(to: CGPoint(x: 0.71224*width, y: 0.84904*height))
        path.addCurve(to: CGPoint(x: 0.69759*width, y: 0.86735*height), control1: CGPoint(x: 0.71224*width, y: 0.85663*height), control2: CGPoint(x: 0.70736*width, y: 0.86274*height))
        path.addCurve(to: CGPoint(x: 0.6626*width, y: 0.87467*height), control1: CGPoint(x: 0.68837*width, y: 0.87223*height), control2: CGPoint(x: 0.6767*width, y: 0.87467*height))
        path.addLine(to: CGPoint(x: 0.32975*width, y: 0.87467*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.11735*width, y: 0.41121*height))
        path.addLine(to: CGPoint(x: 0.87337*width, y: 0.41121*height))
        path.addLine(to: CGPoint(x: 0.87337*width, y: 0.2924*height))
        path.addLine(to: CGPoint(x: 0.11735*width, y: 0.2924*height))
        path.addLine(to: CGPoint(x: 0.11735*width, y: 0.41121*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.11735*width, y: 0.70215*height))
        path.addLine(to: CGPoint(x: 0.87337*width, y: 0.70215*height))
        path.addLine(to: CGPoint(x: 0.87337*width, y: 0.58333*height))
        path.addLine(to: CGPoint(x: 0.11735*width, y: 0.58333*height))
        path.addLine(to: CGPoint(x: 0.11735*width, y: 0.70215*height))
        path.closeSubpath()
        return path
    }
}


struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let w = rect.size.width
        let h = rect.size.height

        // Make sure we do not exceed the size of the rectangle
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)

        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)

        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)

        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)

        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        path.closeSubpath()

        return path
    }
}

struct ExtractedView: View {

    var width = 6.6
    var height = 6.6
    var offset = -5.0
    var lineWidth = 1.8
    var cornerRadius = 1.4
    var strokeColor : Color = .black
    var backgroundColor : Color = .white

    var body: some View {
        VStack(spacing: -1.5) {
            ZStack{
                Rectangle()
                    .strokeBorder(strokeColor,lineWidth: lineWidth)
                    .clipShape(RoundedCorners(tl: 2, tr:2, bl: 0, br: 0))
                    .frame(width: width, height: height)
                    .offset(x: offset)
                

                Rectangle()
                    .clipShape(RoundedCorners(tl: 1, tr:1, bl: 0, br: 0))
                    .foregroundColor(.white)
                    .frame(width: 3.8, height: 3.4)
                    .offset(x: offset)
            }
            .zIndex(4)

            ZStack{
                Rectangle()
                    .strokeBorder(strokeColor,lineWidth: lineWidth)
                    .frame(width: width, height: height)
                    .offset(x: offset)

                Rectangle()
                    .clipShape(RoundedCorners(tl: 0, tr:0, bl: 0, br: 0))
                    .foregroundColor(.white)
                    .frame(width: 3.8, height: 3.4)
                    .offset(x: offset)
            }
            .zIndex(3)

            ZStack{
                Rectangle()
                    .strokeBorder(strokeColor,lineWidth: lineWidth)
                    .clipShape(RoundedCorners(tl: 0, tr:0, bl: 2, br: 2))
                    .frame(width: width, height: height)
                    .offset(x: offset)

                Rectangle()
                    .clipShape(RoundedCorners(tl: 0, tr:0, bl: 1, br: 1))
                    .foregroundColor(.white)
                    .frame(width: 3.8, height: 3.4)
                    .offset(x: offset)
            }
            .zIndex(4)

        }
    }
}

struct VerticalPalette: View {
    var offset = -5.0

    var body: some View {
        VerticalPaletteShape()
            .background(
                Color.white
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .scaleEffect(x: 0.8, y: 0.9)
            )
            .foregroundColor(.black)
            .frame(width: 8, height: 17)
            .offset(x: offset)
    }
}
