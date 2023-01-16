//
//  Eyedropper.swift
//  AnimatedIcons
//
//  Created by Miguel Ferreira on 15/01/2023.
//

import SwiftUI

struct Eyedropper: View {
    @State private var insetAmount = 0.0
    @State private var insetAmount2 = 0.0
    @State var scaled : Bool = false
    @State var hovering = false

    @State var eyedropperRotation = false

    @State var paintScale = 0.0

    var springyAnimation = Animation.interpolatingSpring(mass: 0.10, stiffness: 7.15, damping: 0.43, initialVelocity: 3.25)

    @Binding var animate : Bool

    init(animate : Binding<Bool> = .constant(false)){
        self._animate = animate
    }


    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.green)
                    .frame(width: 2, height: 12)
                    .scaleEffect(y: paintScale, anchor: .bottom)
                    .rotationEffect(Angle(degrees: eyedropperRotation ? 0.0 : 45))

                MyCustomShape()
                    .offset(x: eyedropperRotation ? -0.6: -0.25)
                    .scaleEffect(x: scaled ? 0.8 : 1, anchor: .center)
                    .scaleEffect(y: scaled ? 1.1 : 1)
                    .frame(width: 6, height: 7)
                    .offset(y: -9)
                    .rotationEffect(Angle(degrees: 45), anchor: .center)
                    .foregroundColor(.black)
                    .rotationEffect(Angle(degrees: eyedropperRotation ? -42.5 : 0.0), anchor: .center)


                MyCustomShape1()
                    .foregroundColor(.black)
                    .frame(width: 13.95, height: 13.82)
                    .rotationEffect(Angle(degrees: eyedropperRotation ? -45.0 : 0.0), anchor: .center)

            }
            .offset(y: 1)
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
            scaled = true
            eyedropperRotation = true
            paintScale = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(springyAnimation.delay(0.2)){
                    scaled = false
                    paintScale = 0.7
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                withAnimation(springyAnimation.delay(0.2)){
                    eyedropperRotation = false
                }
                withAnimation(.spring().delay(0.2)){
                    paintScale = 0.0
                }
            }
        }
    }
}

struct Eyedropper_Previews: PreviewProvider {
    static var previews: some View {
        Eyedropper()
    }
}

struct MyCustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.77805*width, y: 0.89977*height))
        path.addCurve(to: CGPoint(x: 0.94082*width, y: 0.36959*height), control1: CGPoint(x: 0.79383*width, y: 0.67727*height), control2: CGPoint(x: 0.94279*width, y: 0.53225*height))
        path.addCurve(to: CGPoint(x: 0.47816*width, y: 0.01589*height), control1: CGPoint(x: 0.93984*width, y: 0.14018*height), control2: CGPoint(x: 0.68532*width, y: 0.01589*height))
        path.addCurve(to: CGPoint(x: 0.0155*width, y: 0.3696*height), control1: CGPoint(x: 0.271*width, y: 0.01435*height), control2: CGPoint(x: 0.02143*width, y: 0.13941*height))
        path.addCurve(to: CGPoint(x: 0.17828*width, y: 0.89977*height), control1: CGPoint(x: 0.01156*width, y: 0.53226*height), control2: CGPoint(x: 0.16248*width, y: 0.67727*height))
        path.addLine(to: CGPoint(x: 0.77805*width, y: 0.89977*height))
        path.closeSubpath()
        return path
    }
}

struct MyCustomShape1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.72094*width, y: 0.27884*height))
        path.addLine(to: CGPoint(x: 0.67842*width, y: 0.32125*height))
        path.addLine(to: CGPoint(x: 0.25666*width, y: 0.74207*height))
        path.addCurve(to: CGPoint(x: 0.23598*width, y: 0.75448*height), control1: CGPoint(x: 0.24977*width, y: 0.74931*height), control2: CGPoint(x: 0.24288*width, y: 0.75345*height))
        path.addCurve(to: CGPoint(x: 0.21841*width, y: 0.74828*height), control1: CGPoint(x: 0.22909*width, y: 0.75586*height), control2: CGPoint(x: 0.22323*width, y: 0.75379*height))
        path.addCurve(to: CGPoint(x: 0.21065*width, y: 0.72811*height), control1: CGPoint(x: 0.21255*width, y: 0.74138*height), control2: CGPoint(x: 0.20996*width, y: 0.73466*height))
        path.addCurve(to: CGPoint(x: 0.22254*width, y: 0.70744*height), control1: CGPoint(x: 0.21134*width, y: 0.72191*height), control2: CGPoint(x: 0.2153*width, y: 0.71502*height))
        path.addLine(to: CGPoint(x: 0.64299*width, y: 0.28605*height))
        path.addLine(to: CGPoint(x: 0.68578*width, y: 0.24316*height))
        path.addLine(to: CGPoint(x: 0.60254*width, y: 0.16251*height))
        path.addLine(to: CGPoint(x: 0.56078*width, y: 0.20439*height))
        path.addLine(to: CGPoint(x: 0.21634*width, y: 0.54975*height))
        path.addCurve(to: CGPoint(x: 0.12793*width, y: 0.64746*height), control1: CGPoint(x: 0.17911*width, y: 0.58697*height), control2: CGPoint(x: 0.14964*width, y: 0.61954*height))
        path.addCurve(to: CGPoint(x: 0.07881*width, y: 0.72088*height), control1: CGPoint(x: 0.10656*width, y: 0.67538*height), control2: CGPoint(x: 0.09019*width, y: 0.69985*height))
        path.addCurve(to: CGPoint(x: 0.05141*width, y: 0.77826*height), control1: CGPoint(x: 0.06744*width, y: 0.74225*height), control2: CGPoint(x: 0.05831*width, y: 0.76138*height))
        path.addCurve(to: CGPoint(x: 0.03125*width, y: 0.82738*height), control1: CGPoint(x: 0.04486*width, y: 0.79549*height), control2: CGPoint(x: 0.03814*width, y: 0.81187*height))
        path.addCurve(to: CGPoint(x: 0.00126*width, y: 0.87649*height), control1: CGPoint(x: 0.02436*width, y: 0.84289*height), control2: CGPoint(x: 0.01436*width, y: 0.85926*height))
        path.addLine(to: CGPoint(x: 0.07364*width, y: 0.95301*height))
        path.addCurve(to: CGPoint(x: 0.12276*width, y: 0.92199*height), control1: CGPoint(x: 0.09019*width, y: 0.93922*height), control2: CGPoint(x: 0.10656*width, y: 0.92888*height))
        path.addCurve(to: CGPoint(x: 0.17498*width, y: 0.90286*height), control1: CGPoint(x: 0.1393*width, y: 0.91544*height), control2: CGPoint(x: 0.15671*width, y: 0.90906*height))
        path.addCurve(to: CGPoint(x: 0.23598*width, y: 0.87805*height), control1: CGPoint(x: 0.19359*width, y: 0.897*height), control2: CGPoint(x: 0.21392*width, y: 0.88873*height))
        path.addCurve(to: CGPoint(x: 0.31198*width, y: 0.831*height), control1: CGPoint(x: 0.25839*width, y: 0.86736*height), control2: CGPoint(x: 0.28372*width, y: 0.85168*height))
        path.addCurve(to: CGPoint(x: 0.41021*width, y: 0.74518*height), control1: CGPoint(x: 0.34025*width, y: 0.81032*height), control2: CGPoint(x: 0.37299*width, y: 0.78171*height))
        path.addLine(to: CGPoint(x: 0.7577*width, y: 0.4*height))
        path.addLine(to: CGPoint(x: 0.799*width, y: 0.35897*height))
        path.addLine(to: CGPoint(x: 0.72094*width, y: 0.27884*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.67842*width, y: 0.32125*height))
        path.addLine(to: CGPoint(x: 0.72094*width, y: 0.27884*height))
        path.addLine(to: CGPoint(x: 0.799*width, y: 0.35897*height))
        path.addLine(to: CGPoint(x: 0.7577*width, y: 0.4*height))
        path.addLine(to: CGPoint(x: 0.77677*width, y: 0.41895*height))
        path.addCurve(to: CGPoint(x: 0.83674*width, y: 0.45048*height), control1: CGPoint(x: 0.79745*width, y: 0.43928*height), control2: CGPoint(x: 0.81744*width, y: 0.44979*height))
        path.addCurve(to: CGPoint(x: 0.89671*width, y: 0.42101*height), control1: CGPoint(x: 0.85639*width, y: 0.45117*height), control2: CGPoint(x: 0.87638*width, y: 0.44135*height))
        path.addLine(to: CGPoint(x: 0.91739*width, y: 0.40033*height))
        path.addCurve(to: CGPoint(x: 0.94428*width, y: 0.34088*height), control1: CGPoint(x: 0.93566*width, y: 0.38172*height), control2: CGPoint(x: 0.94462*width, y: 0.3619*height))
        path.addCurve(to: CGPoint(x: 0.91584*width, y: 0.27987*height), control1: CGPoint(x: 0.94428*width, y: 0.31951*height), control2: CGPoint(x: 0.9348*width, y: 0.29917*height))
        path.addLine(to: CGPoint(x: 0.90447*width, y: 0.26798*height))
        path.addLine(to: CGPoint(x: 0.69405*width, y: 0.05756*height))
        path.addLine(to: CGPoint(x: 0.68319*width, y: 0.04567*height))
        path.addCurve(to: CGPoint(x: 0.62322*width, y: 0.01775*height), control1: CGPoint(x: 0.66527*width, y: 0.02706*height), control2: CGPoint(x: 0.64528*width, y: 0.01775*height))
        path.addCurve(to: CGPoint(x: 0.56221*width, y: 0.04515*height), control1: CGPoint(x: 0.60151*width, y: 0.01741*height), control2: CGPoint(x: 0.58117*width, y: 0.02654*height))
        path.addLine(to: CGPoint(x: 0.54102*width, y: 0.0648*height))
        path.addCurve(to: CGPoint(x: 0.51103*width, y: 0.1258*height), control1: CGPoint(x: 0.52034*width, y: 0.08513*height), control2: CGPoint(x: 0.51034*width, y: 0.10547*height))
        path.addCurve(to: CGPoint(x: 0.54308*width, y: 0.18681*height), control1: CGPoint(x: 0.51172*width, y: 0.1458*height), control2: CGPoint(x: 0.5224*width, y: 0.16613*height))
        path.addLine(to: CGPoint(x: 0.56078*width, y: 0.20439*height))
        path.addLine(to: CGPoint(x: 0.60254*width, y: 0.16251*height))
        path.addLine(to: CGPoint(x: 0.68578*width, y: 0.24316*height))
        path.addLine(to: CGPoint(x: 0.64299*width, y: 0.28605*height))
        path.addLine(to: CGPoint(x: 0.67842*width, y: 0.32125*height))
        path.closeSubpath()
        return path
    }
}
struct MyCustomShape2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.78001*width, y: 0.32018*height))
        path.addLine(to: CGPoint(x: 0.71357*width, y: 0.25765*height))
        path.addLine(to: CGPoint(x: 0.19409*width, y: 0.74874*height))
        path.addCurve(to: CGPoint(x: 0.18799*width, y: 0.81652*height), control1: CGPoint(x: 0.17029*width, y: 0.77171*height), control2: CGPoint(x: 0.1654*width, y: 0.79354*height))
        path.addCurve(to: CGPoint(x: 0.25818*width, y: 0.81078*height), control1: CGPoint(x: 0.20874*width, y: 0.83778*height), control2: CGPoint(x: 0.23682*width, y: 0.83146*height))
        path.addLine(to: CGPoint(x: 0.78001*width, y: 0.32018*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.66132*width, y: 0.20847*height))
        path.addLine(to: CGPoint(x: 0.2002*width, y: 0.64246*height))
        path.addCurve(to: CGPoint(x: 0.06011*width, y: 0.82108*height), control1: CGPoint(x: 0.08612*width, y: 0.74983*height), control2: CGPoint(x: 0.07432*width, y: 0.78216*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.92854*height), control1: CGPoint(x: 0.05083*width, y: 0.84651*height), control2: CGPoint(x: 0.04052*width, y: 0.87474*height))
        path.addLine(to: CGPoint(x: 0.05493*width, y: 0.98311*height))
        path.addCurve(to: CGPoint(x: 0.17112*width, y: 0.9293*height), control1: CGPoint(x: 0.11149*width, y: 0.94429*height), control2: CGPoint(x: 0.14206*width, y: 0.93661*height))
        path.addCurve(to: CGPoint(x: 0.36743*width, y: 0.80159*height), control1: CGPoint(x: 0.21387*width, y: 0.91855*height), control2: CGPoint(x: 0.25333*width, y: 0.90864*height))
        path.addLine(to: CGPoint(x: 0.83089*width, y: 0.36807*height))
        path.addLine(to: CGPoint(x: 0.85693*width, y: 0.39258*height))
        path.addCurve(to: CGPoint(x: 0.95703*width, y: 0.3943*height), control1: CGPoint(x: 0.88928*width, y: 0.42302*height), control2: CGPoint(x: 0.92163*width, y: 0.42934*height))
        path.addLine(to: CGPoint(x: 0.97412*width, y: 0.37649*height))
        path.addCurve(to: CGPoint(x: 0.97351*width, y: 0.28286*height), control1: CGPoint(x: 1.00403*width, y: 0.3472*height), control2: CGPoint(x: 1.00586*width, y: 0.31273*height))
        path.addLine(to: CGPoint(x: 0.9552*width, y: 0.2662*height))
        path.addLine(to: CGPoint(x: 0.76966*width, y: 0.09157*height))
        path.addLine(to: CGPoint(x: 0.75195*width, y: 0.07433*height))
        path.addCurve(to: CGPoint(x: 0.65247*width, y: 0.07376*height), control1: CGPoint(x: 0.72083*width, y: 0.04446*height), control2: CGPoint(x: 0.68359*width, y: 0.04561*height))
        path.addLine(to: CGPoint(x: 0.63416*width, y: 0.08984*height))
        path.addCurve(to: CGPoint(x: 0.63538*width, y: 0.18405*height), control1: CGPoint(x: 0.59631*width, y: 0.12374*height), control2: CGPoint(x: 0.60364*width, y: 0.15361*height))
        path.addLine(to: CGPoint(x: 0.66132*width, y: 0.20847*height))
        path.closeSubpath()
        return path
    }
}
