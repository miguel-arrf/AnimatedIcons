//
//  SwiftUIView.swift
//  
//
//  Created by Miguel Ferreira on 16/01/2023.
//

import SwiftUI

public struct SaveArrow: View {

    @State var arrowOffset  = 0.0
    @State var arrowScale = 1.0
    @State var arrowBlur = 0.0
    @State var arrowOpacity = 1.0

    @State var boxOffset = 0.0

    var springyAnimation = Animation.interpolatingSpring(mass: 0.10, stiffness: 7.15, damping: 0.43, initialVelocity: 3.25)

    @Binding var animate : Bool

    @State var animating = false

    public init(animate : Binding<Bool> = .constant(false)){
        self._animate = animate
    }

    public var body: some View {
        ZStack{
            DownArrowBoxShape()
                .frame(width: 17, height: 15)
                .foregroundColor(.black)
                .offset(y: boxOffset)

            DownArrowShape()
                .frame(width: 8.6, height: 14.14)
                .offset(y: -5)
                .offset(y: arrowOffset)
                .scaleEffect(arrowScale)
                .blur(radius: arrowBlur)
                .opacity(arrowOpacity)
                .mask(
                    Rectangle().frame(height: 20)
                        .offset(y: -3.5)
                   )
                .foregroundColor(.black)

        }
        .offset(x: 0.3)
        .offset(y: 2)
        .onHover(perform: { hover in
            if hover {
                animation()
            }

        })
        .onChange(of: animate){ newValue in
            if newValue {
                animation()
            }
        }

    }

    func animation(){
        if !animating {
            animating = true
            withAnimation(.spring()){
                arrowOffset = 20
                arrowScale = 0.5
                arrowBlur = 1.0
                arrowOpacity = 0.0
                boxOffset = 1.0
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation{
                    boxOffset = 0.0
                }
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                arrowOffset = -15
                arrowScale = 1.0
                arrowOpacity = 0.0
                withAnimation(.spring()){
                    arrowOpacity = 1.0
                    arrowBlur = 0.0
                    arrowOffset = 0
                }
                animating = false
            }
        }

    }
}

struct SaveArrow_Previews: PreviewProvider {
    static var previews: some View {
        SaveArrow()
    }
}

struct DownArrowBoxShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.19141*width, y: 0.95215*height))
        path.addLine(to: CGPoint(x: 0.76269*width, y: 0.95215*height))
        path.addCurve(to: CGPoint(x: 0.90381*width, y: 0.89557*height), control1: CGPoint(x: 0.82324*width, y: 0.95215*height), control2: CGPoint(x: 0.87028*width, y: 0.93329*height))
        path.addCurve(to: CGPoint(x: 0.9541*width, y: 0.73682*height), control1: CGPoint(x: 0.93734*width, y: 0.85785*height), control2: CGPoint(x: 0.9541*width, y: 0.80493*height))
        path.addLine(to: CGPoint(x: 0.9541*width, y: 0.23035*height))
        path.addCurve(to: CGPoint(x: 0.90381*width, y: 0.07159*height), control1: CGPoint(x: 0.9541*width, y: 0.16223*height), control2: CGPoint(x: 0.93734*width, y: 0.10931*height))
        path.addCurve(to: CGPoint(x: 0.76269*width, y: 0.01501*height), control1: CGPoint(x: 0.87028*width, y: 0.03387*height), control2: CGPoint(x: 0.82324*width, y: 0.01501*height))
        path.addLine(to: CGPoint(x: 0.64746*width, y: 0.01501*height))
        path.addLine(to: CGPoint(x: 0.64746*width, y: 0.21002*height))
        path.addLine(to: CGPoint(x: 0.73633*width, y: 0.21002*height))
        path.addCurve(to: CGPoint(x: 0.76953*width, y: 0.22156*height), control1: CGPoint(x: 0.7513*width, y: 0.21002*height), control2: CGPoint(x: 0.76237*width, y: 0.21387*height))
        path.addCurve(to: CGPoint(x: 0.78076*width, y: 0.26001*height), control1: CGPoint(x: 0.77702*width, y: 0.22888*height), control2: CGPoint(x: 0.78076*width, y: 0.2417*height))
        path.addLine(to: CGPoint(x: 0.78076*width, y: 0.70716*height))
        path.addCurve(to: CGPoint(x: 0.76953*width, y: 0.74561*height), control1: CGPoint(x: 0.78076*width, y: 0.7251*height), control2: CGPoint(x: 0.77702*width, y: 0.73791*height))
        path.addCurve(to: CGPoint(x: 0.73633*width, y: 0.75714*height), control1: CGPoint(x: 0.76237*width, y: 0.75329*height), control2: CGPoint(x: 0.7513*width, y: 0.75714*height))
        path.addLine(to: CGPoint(x: 0.21777*width, y: 0.75714*height))
        path.addCurve(to: CGPoint(x: 0.18408*width, y: 0.74561*height), control1: CGPoint(x: 0.2028*width, y: 0.75714*height), control2: CGPoint(x: 0.19157*width, y: 0.75329*height))
        path.addCurve(to: CGPoint(x: 0.17334*width, y: 0.70716*height), control1: CGPoint(x: 0.17692*width, y: 0.73791*height), control2: CGPoint(x: 0.17334*width, y: 0.7251*height))
        path.addLine(to: CGPoint(x: 0.17334*width, y: 0.26001*height))
        path.addCurve(to: CGPoint(x: 0.18408*width, y: 0.22156*height), control1: CGPoint(x: 0.17334*width, y: 0.2417*height), control2: CGPoint(x: 0.17692*width, y: 0.22888*height))
        path.addCurve(to: CGPoint(x: 0.21777*width, y: 0.21002*height), control1: CGPoint(x: 0.19157*width, y: 0.21387*height), control2: CGPoint(x: 0.2028*width, y: 0.21002*height))
        path.addLine(to: CGPoint(x: 0.31152*width, y: 0.21002*height))
        path.addLine(to: CGPoint(x: 0.31152*width, y: 0.01501*height))
        path.addLine(to: CGPoint(x: 0.19141*width, y: 0.01501*height))
        path.addCurve(to: CGPoint(x: 0.05029*width, y: 0.07159*height), control1: CGPoint(x: 0.13118*width, y: 0.01501*height), control2: CGPoint(x: 0.08415*width, y: 0.03387*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.23035*height), control1: CGPoint(x: 0.01676*width, y: 0.10931*height), control2: CGPoint(x: 0, y: 0.16223*height))
        path.addLine(to: CGPoint(x: 0, y: 0.73682*height))
        path.addCurve(to: CGPoint(x: 0.05029*width, y: 0.89557*height), control1: CGPoint(x: 0, y: 0.80493*height), control2: CGPoint(x: 0.01676*width, y: 0.85785*height))
        path.addCurve(to: CGPoint(x: 0.19141*width, y: 0.95215*height), control1: CGPoint(x: 0.08415*width, y: 0.93329*height), control2: CGPoint(x: 0.13118*width, y: 0.95215*height))
        path.closeSubpath()
        return path
    }
}

struct DownArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.48281*width, y: 0.99505*height))
        path.addCurve(to: CGPoint(x: 0.53818*width, y: 0.98802*height), control1: CGPoint(x: 0.50098*width, y: 0.99505*height), control2: CGPoint(x: 0.51943*width, y: 0.99271*height))
        path.addCurve(to: CGPoint(x: 0.59268*width, y: 0.96341*height), control1: CGPoint(x: 0.55693*width, y: 0.98294*height), control2: CGPoint(x: 0.5751*width, y: 0.97474*height))
        path.addLine(to: CGPoint(x: 0.8792*width, y: 0.7806*height))
        path.addCurve(to: CGPoint(x: 0.9126*width, y: 0.72903*height), control1: CGPoint(x: 0.90146*width, y: 0.76575*height), control2: CGPoint(x: 0.9126*width, y: 0.74857*height))
        path.addCurve(to: CGPoint(x: 0.87744*width, y: 0.67689*height), control1: CGPoint(x: 0.9126*width, y: 0.70755*height), control2: CGPoint(x: 0.90088*width, y: 0.69017*height))
        path.addCurve(to: CGPoint(x: 0.80098*width, y: 0.65697*height), control1: CGPoint(x: 0.854*width, y: 0.66361*height), control2: CGPoint(x: 0.82852*width, y: 0.65697*height))
        path.addCurve(to: CGPoint(x: 0.71572*width, y: 0.68157*height), control1: CGPoint(x: 0.76758*width, y: 0.65697*height), control2: CGPoint(x: 0.73916*width, y: 0.66517*height))
        path.addLine(to: CGPoint(x: 0.63662*width, y: 0.73783*height))
        path.addLine(to: CGPoint(x: 0.59443*width, y: 0.78705*height))
        path.addLine(to: CGPoint(x: 0.61641*width, y: 0.70267*height))
        path.addLine(to: CGPoint(x: 0.61641*width, y: 0.14076*height))
        path.addCurve(to: CGPoint(x: 0.57773*width, y: 0.07865*height), control1: CGPoint(x: 0.61641*width, y: 0.11693*height), control2: CGPoint(x: 0.60352*width, y: 0.09622*height))
        path.addCurve(to: CGPoint(x: 0.48281*width, y: 0.05228*height), control1: CGPoint(x: 0.55254*width, y: 0.06107*height), control2: CGPoint(x: 0.5209*width, y: 0.05228*height))
        path.addCurve(to: CGPoint(x: 0.38789*width, y: 0.07865*height), control1: CGPoint(x: 0.44531*width, y: 0.05228*height), control2: CGPoint(x: 0.41367*width, y: 0.06107*height))
        path.addCurve(to: CGPoint(x: 0.34922*width, y: 0.14076*height), control1: CGPoint(x: 0.36211*width, y: 0.09622*height), control2: CGPoint(x: 0.34922*width, y: 0.11693*height))
        path.addLine(to: CGPoint(x: 0.34922*width, y: 0.70267*height))
        path.addLine(to: CGPoint(x: 0.37207*width, y: 0.78705*height))
        path.addLine(to: CGPoint(x: 0.329*width, y: 0.73783*height))
        path.addLine(to: CGPoint(x: 0.2499*width, y: 0.68157*height))
        path.addCurve(to: CGPoint(x: 0.16465*width, y: 0.65697*height), control1: CGPoint(x: 0.22646*width, y: 0.66517*height), control2: CGPoint(x: 0.19805*width, y: 0.65697*height))
        path.addCurve(to: CGPoint(x: 0.08818*width, y: 0.67689*height), control1: CGPoint(x: 0.13711*width, y: 0.65697*height), control2: CGPoint(x: 0.11162*width, y: 0.66361*height))
        path.addCurve(to: CGPoint(x: 0.05303*width, y: 0.72903*height), control1: CGPoint(x: 0.06475*width, y: 0.69017*height), control2: CGPoint(x: 0.05303*width, y: 0.70755*height))
        path.addCurve(to: CGPoint(x: 0.08643*width, y: 0.7806*height), control1: CGPoint(x: 0.05303*width, y: 0.74857*height), control2: CGPoint(x: 0.06416*width, y: 0.76575*height))
        path.addLine(to: CGPoint(x: 0.37295*width, y: 0.96341*height))
        path.addCurve(to: CGPoint(x: 0.42744*width, y: 0.98802*height), control1: CGPoint(x: 0.39111*width, y: 0.97474*height), control2: CGPoint(x: 0.40928*width, y: 0.98294*height))
        path.addCurve(to: CGPoint(x: 0.48281*width, y: 0.99505*height), control1: CGPoint(x: 0.44619*width, y: 0.99271*height), control2: CGPoint(x: 0.46465*width, y: 0.99505*height))
        path.closeSubpath()
        return path
    }
}
