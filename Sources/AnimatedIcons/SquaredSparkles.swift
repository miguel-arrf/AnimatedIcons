//
//  SquaredSparkles.swift
//  AnimatedIcons
//
//  Created by Miguel Ferreira on 16/01/2023.
//

import SwiftUI

struct SquaredSparkles: View {
    @State var hovering : Bool = false

    @Binding var animate : Bool

    init(animate : Binding<Bool> = .constant(false)){
        self._animate = animate
    }


    var body: some View {
        ZStack{
                RoundedRectangle(cornerRadius: 2)
                    .foregroundColor(.clear)
                    .frame(width: 10, height: 10)
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(.black, lineWidth: 2.1)
                    )
                    .offset(x: hovering ? 0.0 : -1.6, y: hovering ?  0.0 : -1.6)

                RoundedRectangle(cornerRadius: 2.2)
                    .frame(width: 11, height: 11)
                    .offset(x: hovering ? 0.0 : 2, y: hovering ? 0.0 : 2)
                    .foregroundColor(.black)


//            Text(Image(systemName: "sparkle"))
//                .font(.system(size: 6))
//                .fontWeight(.heavy)
//                .foregroundColor(.white)
//                .rotationEffect(Angle(degrees: hovering ? -15 : 0))
//                .offset(x: hovering ? 0.0 : 2.4, y: hovering ? 0.0 : 1.5)

            SparkleShape()
                .frame(width: 6, height: 6)
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: hovering ? 360 : 0))
                .offset(x: hovering ? 0.0 : 2.4, y: hovering ? 0.0 : 1.5)

//            Text(Image(systemName: "sparkle"))
//                .font(.system(size: 3))
//                .fontWeight(.heavy)

            SparkleShape()
                .frame(width: 3, height: 3)
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: hovering ? 45 : 0))
                .offset(x: hovering ? -2.2 : -0.2, y: hovering ? 2.8 : 4)
        }
        .onHover(perform: { hover in
            animation()
        })
        .onChange(of: animate){ newValue in
            if newValue {
                animation()
            }
        }
    }

    func animation(){
        withAnimation(.interpolatingSpring(stiffness: 300, damping: 15)){
            hovering = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.interpolatingSpring(stiffness: 300, damping: 15)){
                hovering = false
            }
        }
    }
}

struct SquaredSparkles_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SquaredSparkles()
        }
    }
}



struct SparkleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.49981*width, y: 0.96982*height))
        path.addCurve(to: CGPoint(x: 0.53874*width, y: 0.95475*height), control1: CGPoint(x: 0.51488*width, y: 0.96982*height), control2: CGPoint(x: 0.52786*width, y: 0.9648*height))
        path.addCurve(to: CGPoint(x: 0.55883*width, y: 0.91625*height), control1: CGPoint(x: 0.5499*width, y: 0.94471*height), control2: CGPoint(x: 0.5566*width, y: 0.93187*height))
        path.addCurve(to: CGPoint(x: 0.5852*width, y: 0.7752*height), control1: CGPoint(x: 0.56692*width, y: 0.86044*height), control2: CGPoint(x: 0.5757*width, y: 0.81343*height))
        path.addCurve(to: CGPoint(x: 0.62202*width, y: 0.68145*height), control1: CGPoint(x: 0.59496*width, y: 0.73698*height), control2: CGPoint(x: 0.60724*width, y: 0.70573*height))
        path.addCurve(to: CGPoint(x: 0.6802*width, y: 0.62286*height), control1: CGPoint(x: 0.63681*width, y: 0.6569*height), control2: CGPoint(x: 0.6562*width, y: 0.63737*height))
        path.addCurve(to: CGPoint(x: 0.77102*width, y: 0.58896*height), control1: CGPoint(x: 0.7042*width, y: 0.60835*height), control2: CGPoint(x: 0.73447*width, y: 0.59705*height))
        path.addCurve(to: CGPoint(x: 0.90704*width, y: 0.5672*height), control1: CGPoint(x: 0.80785*width, y: 0.58059*height), control2: CGPoint(x: 0.85319*width, y: 0.57333*height))
        path.addCurve(to: CGPoint(x: 0.94596*width, y: 0.54711*height), control1: CGPoint(x: 0.92239*width, y: 0.56524*height), control2: CGPoint(x: 0.93536*width, y: 0.55855*height))
        path.addCurve(to: CGPoint(x: 0.96187*width, y: 0.50735*height), control1: CGPoint(x: 0.95657*width, y: 0.53567*height), control2: CGPoint(x: 0.96187*width, y: 0.52241*height))
        path.addCurve(to: CGPoint(x: 0.94596*width, y: 0.46759*height), control1: CGPoint(x: 0.96187*width, y: 0.492*height), control2: CGPoint(x: 0.95657*width, y: 0.47875*height))
        path.addCurve(to: CGPoint(x: 0.90746*width, y: 0.44708*height), control1: CGPoint(x: 0.93564*width, y: 0.45643*height), control2: CGPoint(x: 0.9228*width, y: 0.44959*height))
        path.addCurve(to: CGPoint(x: 0.77311*width, y: 0.42322*height), control1: CGPoint(x: 0.85417*width, y: 0.43983*height), control2: CGPoint(x: 0.80939*width, y: 0.43187*height))
        path.addCurve(to: CGPoint(x: 0.68313*width, y: 0.38849*height), control1: CGPoint(x: 0.73684*width, y: 0.4143*height), control2: CGPoint(x: 0.70685*width, y: 0.40272*height))
        path.addCurve(to: CGPoint(x: 0.62579*width, y: 0.33115*height), control1: CGPoint(x: 0.65969*width, y: 0.37426*height), control2: CGPoint(x: 0.64058*width, y: 0.35514*height))
        path.addCurve(to: CGPoint(x: 0.58854*width, y: 0.23823*height), control1: CGPoint(x: 0.611*width, y: 0.30687*height), control2: CGPoint(x: 0.59859*width, y: 0.2759*height))
        path.addCurve(to: CGPoint(x: 0.55883*width, y: 0.09803*height), control1: CGPoint(x: 0.5785*width, y: 0.20057*height), control2: CGPoint(x: 0.56859*width, y: 0.15383*height))
        path.addCurve(to: CGPoint(x: 0.53832*width, y: 0.05994*height), control1: CGPoint(x: 0.55604*width, y: 0.0824*height), control2: CGPoint(x: 0.5492*width, y: 0.06971*height))
        path.addCurve(to: CGPoint(x: 0.49981*width, y: 0.04488*height), control1: CGPoint(x: 0.52744*width, y: 0.0499*height), control2: CGPoint(x: 0.5146*width, y: 0.04488*height))
        path.addCurve(to: CGPoint(x: 0.46005*width, y: 0.05994*height), control1: CGPoint(x: 0.48447*width, y: 0.04488*height), control2: CGPoint(x: 0.47121*width, y: 0.0499*height))
        path.addCurve(to: CGPoint(x: 0.43996*width, y: 0.09845*height), control1: CGPoint(x: 0.44917*width, y: 0.06999*height), control2: CGPoint(x: 0.44248*width, y: 0.08282*height))
        path.addCurve(to: CGPoint(x: 0.4136*width, y: 0.23949*height), control1: CGPoint(x: 0.43187*width, y: 0.15425*height), control2: CGPoint(x: 0.42308*width, y: 0.20126*height))
        path.addCurve(to: CGPoint(x: 0.3776*width, y: 0.33324*height), control1: CGPoint(x: 0.40439*width, y: 0.27744*height), control2: CGPoint(x: 0.39239*width, y: 0.30869*height))
        path.addCurve(to: CGPoint(x: 0.31943*width, y: 0.39183*height), control1: CGPoint(x: 0.36282*width, y: 0.35779*height), control2: CGPoint(x: 0.34342*width, y: 0.37733*height))
        path.addCurve(to: CGPoint(x: 0.22819*width, y: 0.42573*height), control1: CGPoint(x: 0.29543*width, y: 0.40606*height), control2: CGPoint(x: 0.26502*width, y: 0.41736*height))
        path.addCurve(to: CGPoint(x: 0.09301*width, y: 0.44708*height), control1: CGPoint(x: 0.19164*width, y: 0.43383*height), control2: CGPoint(x: 0.14658*width, y: 0.44094*height))
        path.addCurve(to: CGPoint(x: 0.05325*width, y: 0.46759*height), control1: CGPoint(x: 0.0771*width, y: 0.44931*height), control2: CGPoint(x: 0.06385*width, y: 0.45615*height))
        path.addCurve(to: CGPoint(x: 0.03776*width, y: 0.50735*height), control1: CGPoint(x: 0.04292*width, y: 0.47875*height), control2: CGPoint(x: 0.03776*width, y: 0.492*height))
        path.addCurve(to: CGPoint(x: 0.05283*width, y: 0.54711*height), control1: CGPoint(x: 0.03776*width, y: 0.52241*height), control2: CGPoint(x: 0.04278*width, y: 0.53567*height))
        path.addCurve(to: CGPoint(x: 0.09217*width, y: 0.5672*height), control1: CGPoint(x: 0.06315*width, y: 0.55827*height), control2: CGPoint(x: 0.07626*width, y: 0.56497*height))
        path.addCurve(to: CGPoint(x: 0.20768*width, y: 0.58729*height), control1: CGPoint(x: 0.13681*width, y: 0.57361*height), control2: CGPoint(x: 0.17532*width, y: 0.58031*height))
        path.addCurve(to: CGPoint(x: 0.29055*width, y: 0.61281*height), control1: CGPoint(x: 0.24005*width, y: 0.59426*height), control2: CGPoint(x: 0.26767*width, y: 0.60277*height))
        path.addCurve(to: CGPoint(x: 0.34831*width, y: 0.65174*height), control1: CGPoint(x: 0.31343*width, y: 0.62286*height), control2: CGPoint(x: 0.33268*width, y: 0.63583*height))
        path.addCurve(to: CGPoint(x: 0.38765*width, y: 0.71033*height), control1: CGPoint(x: 0.36393*width, y: 0.66736*height), control2: CGPoint(x: 0.37705*width, y: 0.6869*height))
        path.addCurve(to: CGPoint(x: 0.41611*width, y: 0.79613*height), control1: CGPoint(x: 0.39853*width, y: 0.73377*height), control2: CGPoint(x: 0.40802*width, y: 0.76237*height))
        path.addCurve(to: CGPoint(x: 0.43996*width, y: 0.91667*height), control1: CGPoint(x: 0.4242*width, y: 0.82989*height), control2: CGPoint(x: 0.43215*width, y: 0.87007*height))
        path.addCurve(to: CGPoint(x: 0.46089*width, y: 0.95475*height), control1: CGPoint(x: 0.44303*width, y: 0.93229*height), control2: CGPoint(x: 0.45001*width, y: 0.94499*height))
        path.addCurve(to: CGPoint(x: 0.49981*width, y: 0.96982*height), control1: CGPoint(x: 0.47205*width, y: 0.9648*height), control2: CGPoint(x: 0.48502*width, y: 0.96982*height))
        path.closeSubpath()
        return path
    }
}
