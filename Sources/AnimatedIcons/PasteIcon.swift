//
//  SwiftUIView.swift
//  
//
//  Created by Miguel Ferreira on 16/01/2023.
//

import SwiftUI

public struct PasteIcon: View {

    @State var hovering = false

    @Binding var animate : Bool

    var springyAnimation = Animation.interpolatingSpring(mass: 0.10, stiffness: 7.15, damping: 0.43, initialVelocity: 3.25)

    public init(animate : Binding<Bool> = .constant(false)){
        self._animate = animate
    }

    public var body: some View {
        ZStack{
            PasteIconShape()
                .foregroundColor(.black)
                .frame(width: 34, height: 46)

            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.white)
                    .frame(width: 46, height: 42)
                    .offset(x: hovering ? -0.5 : -0.5)

                ImageShape()
                    .background(
                        Color.white
                            .clipShape(RoundedRectangle(cornerRadius:5))
                            .scaleEffect(x: 0.9, y: 0.9)
                    )
                    .foregroundColor(.black)
                .frame(width: 42, height: 36)
            }
            .rotationEffect(Angle(degrees: hovering ? -4 : 0))
            .scaleEffect(hovering ? 0.5 : 0.7)
            .offset(y: hovering ? 5 : 12)
            .offset(x: hovering ? 0 : -6)
        }
        .scaleEffect(0.4)
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
        .frame(width: 22, height: 22)
    }

    func animation(){
        withAnimation(springyAnimation){
            hovering = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(.spring()){
                hovering = false
            }
        }
    }
}

struct PasteIcon_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Text(Image(systemName: "doc.on.doc"))
                .fontWeight(.black)
                .foregroundColor(.black)
            PasteIcon()
        }
    }
}

struct ImageShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.92165*width, y: 0.7417*height))
        path.addLine(to: CGPoint(x: 0.68795*width, y: 0.4751*height))
        path.addCurve(to: CGPoint(x: 0.65958*width, y: 0.45361*height), control1: CGPoint(x: 0.67915*width, y: 0.46533*height), control2: CGPoint(x: 0.6697*width, y: 0.45817*height))
        path.addCurve(to: CGPoint(x: 0.62922*width, y: 0.44629*height), control1: CGPoint(x: 0.64946*width, y: 0.44873*height), control2: CGPoint(x: 0.63934*width, y: 0.44629*height))
        path.addCurve(to: CGPoint(x: 0.59805*width, y: 0.45313*height), control1: CGPoint(x: 0.61856*width, y: 0.44629*height), control2: CGPoint(x: 0.60818*width, y: 0.44857*height))
        path.addCurve(to: CGPoint(x: 0.57009*width, y: 0.47461*height), control1: CGPoint(x: 0.5882*width, y: 0.45768*height), control2: CGPoint(x: 0.57888*width, y: 0.46484*height))
        path.addLine(to: CGPoint(x: 0.39031*width, y: 0.6709*height))
        path.addLine(to: CGPoint(x: 0.3176*width, y: 0.59082*height))
        path.addCurve(to: CGPoint(x: 0.29084*width, y: 0.5708*height), control1: CGPoint(x: 0.30908*width, y: 0.58203*height), control2: CGPoint(x: 0.30016*width, y: 0.57536*height))
        path.addCurve(to: CGPoint(x: 0.26367*width, y: 0.56348*height), control1: CGPoint(x: 0.28178*width, y: 0.56592*height), control2: CGPoint(x: 0.27273*width, y: 0.56348*height))
        path.addCurve(to: CGPoint(x: 0.23651*width, y: 0.57031*height), control1: CGPoint(x: 0.25328*width, y: 0.56348*height), control2: CGPoint(x: 0.24423*width, y: 0.56576*height))
        path.addCurve(to: CGPoint(x: 0.21254*width, y: 0.59033*height), control1: CGPoint(x: 0.22878*width, y: 0.57454*height), control2: CGPoint(x: 0.22079*width, y: 0.58122*height))
        path.addLine(to: CGPoint(x: 0.06832*width, y: 0.74268*height))
        path.addCurve(to: CGPoint(x: 0.10787*width, y: 0.85547*height), control1: CGPoint(x: 0.06832*width, y: 0.79118*height), control2: CGPoint(x: 0.0815*width, y: 0.82878*height))
        path.addCurve(to: CGPoint(x: 0.22013*width, y: 0.89599*height), control1: CGPoint(x: 0.1345*width, y: 0.88249*height), control2: CGPoint(x: 0.17192*width, y: 0.89599*height))
        path.addLine(to: CGPoint(x: 0.76825*width, y: 0.89599*height))
        path.addCurve(to: CGPoint(x: 0.89529*width, y: 0.85547*height), control1: CGPoint(x: 0.8263*width, y: 0.89599*height), control2: CGPoint(x: 0.86865*width, y: 0.88249*height))
        path.addCurve(to: CGPoint(x: 0.92165*width, y: 0.7417*height), control1: CGPoint(x: 0.92219*width, y: 0.82878*height), control2: CGPoint(x: 0.93097*width, y: 0.79086*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.36355*width, y: 0.51221*height))
        path.addCurve(to: CGPoint(x: 0.41468*width, y: 0.49512*height), control1: CGPoint(x: 0.38219*width, y: 0.51221*height), control2: CGPoint(x: 0.39924*width, y: 0.50651*height))
        path.addCurve(to: CGPoint(x: 0.45224*width, y: 0.44922*height), control1: CGPoint(x: 0.4304*width, y: 0.48372*height), control2: CGPoint(x: 0.44292*width, y: 0.46842*height))
        path.addCurve(to: CGPoint(x: 0.46622*width, y: 0.38574*height), control1: CGPoint(x: 0.46156*width, y: 0.43001*height), control2: CGPoint(x: 0.46622*width, y: 0.40885*height))
        path.addCurve(to: CGPoint(x: 0.45224*width, y: 0.32324*height), control1: CGPoint(x: 0.46622*width, y: 0.36296*height), control2: CGPoint(x: 0.46156*width, y: 0.34212*height))
        path.addCurve(to: CGPoint(x: 0.41468*width, y: 0.27734*height), control1: CGPoint(x: 0.44292*width, y: 0.30404*height), control2: CGPoint(x: 0.4304*width, y: 0.28874*height))
        path.addCurve(to: CGPoint(x: 0.36355*width, y: 0.25977*height), control1: CGPoint(x: 0.39924*width, y: 0.26563*height), control2: CGPoint(x: 0.38219*width, y: 0.25977*height))
        path.addCurve(to: CGPoint(x: 0.31161*width, y: 0.27734*height), control1: CGPoint(x: 0.34464*width, y: 0.25977*height), control2: CGPoint(x: 0.32733*width, y: 0.26563*height))
        path.addCurve(to: CGPoint(x: 0.27406*width, y: 0.32324*height), control1: CGPoint(x: 0.2959*width, y: 0.28874*height), control2: CGPoint(x: 0.28338*width, y: 0.30404*height))
        path.addCurve(to: CGPoint(x: 0.26008*width, y: 0.38574*height), control1: CGPoint(x: 0.26474*width, y: 0.34212*height), control2: CGPoint(x: 0.26008*width, y: 0.36296*height))
        path.addCurve(to: CGPoint(x: 0.27406*width, y: 0.44922*height), control1: CGPoint(x: 0.26008*width, y: 0.40885*height), control2: CGPoint(x: 0.26474*width, y: 0.43001*height))
        path.addCurve(to: CGPoint(x: 0.31161*width, y: 0.49512*height), control1: CGPoint(x: 0.28338*width, y: 0.46842*height), control2: CGPoint(x: 0.2959*width, y: 0.48372*height))
        path.addCurve(to: CGPoint(x: 0.36355*width, y: 0.51221*height), control1: CGPoint(x: 0.32733*width, y: 0.50651*height), control2: CGPoint(x: 0.34464*width, y: 0.51221*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.1566*width, y: 0.96826*height))
        path.addLine(to: CGPoint(x: 0.8086*width, y: 0.96826*height))
        path.addCurve(to: CGPoint(x: 0.92365*width, y: 0.91748*height), control1: CGPoint(x: 0.85786*width, y: 0.96826*height), control2: CGPoint(x: 0.89622*width, y: 0.95133*height))
        path.addCurve(to: CGPoint(x: 0.9652*width, y: 0.77686*height), control1: CGPoint(x: 0.95135*width, y: 0.88395*height), control2: CGPoint(x: 0.9652*width, y: 0.83708*height))
        path.addLine(to: CGPoint(x: 0.9652*width, y: 0.19141*height))
        path.addCurve(to: CGPoint(x: 0.92365*width, y: 0.05029*height), control1: CGPoint(x: 0.9652*width, y: 0.13086*height), control2: CGPoint(x: 0.95135*width, y: 0.08382*height))
        path.addCurve(to: CGPoint(x: 0.8086*width, y: 0), control1: CGPoint(x: 0.89622*width, y: 0.01676*height), control2: CGPoint(x: 0.85786*width, y: 0))
        path.addLine(to: CGPoint(x: 0.1566*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.04115*width, y: 0.05029*height), control1: CGPoint(x: 0.10733*width, y: 0), control2: CGPoint(x: 0.06885*width, y: 0.01676*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.19141*height), control1: CGPoint(x: 0.01372*width, y: 0.08382*height), control2: CGPoint(x: 0, y: 0.13086*height))
        path.addLine(to: CGPoint(x: 0, y: 0.77686*height))
        path.addCurve(to: CGPoint(x: 0.04115*width, y: 0.91748*height), control1: CGPoint(x: 0, y: 0.83708*height), control2: CGPoint(x: 0.01372*width, y: 0.88395*height))
        path.addCurve(to: CGPoint(x: 0.1566*width, y: 0.96826*height), control1: CGPoint(x: 0.06885*width, y: 0.95133*height), control2: CGPoint(x: 0.10733*width, y: 0.96826*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.17818*width, y: 0.79492*height))
        path.addCurve(to: CGPoint(x: 0.15061*width, y: 0.78467*height), control1: CGPoint(x: 0.16593*width, y: 0.79492*height), control2: CGPoint(x: 0.15674*width, y: 0.79151*height))
        path.addCurve(to: CGPoint(x: 0.14182*width, y: 0.75*height), control1: CGPoint(x: 0.14475*width, y: 0.77783*height), control2: CGPoint(x: 0.14182*width, y: 0.76628*height))
        path.addLine(to: CGPoint(x: 0.14182*width, y: 0.21777*height))
        path.addCurve(to: CGPoint(x: 0.15061*width, y: 0.18359*height), control1: CGPoint(x: 0.14182*width, y: 0.2015*height), control2: CGPoint(x: 0.14475*width, y: 0.1901*height))
        path.addCurve(to: CGPoint(x: 0.17818*width, y: 0.17334*height), control1: CGPoint(x: 0.15674*width, y: 0.17676*height), control2: CGPoint(x: 0.16593*width, y: 0.17334*height))
        path.addLine(to: CGPoint(x: 0.78702*width, y: 0.17334*height))
        path.addCurve(to: CGPoint(x: 0.81419*width, y: 0.18359*height), control1: CGPoint(x: 0.79927*width, y: 0.17334*height), control2: CGPoint(x: 0.80833*width, y: 0.17676*height))
        path.addCurve(to: CGPoint(x: 0.82338*width, y: 0.21777*height), control1: CGPoint(x: 0.82031*width, y: 0.1901*height), control2: CGPoint(x: 0.82338*width, y: 0.2015*height))
        path.addLine(to: CGPoint(x: 0.82338*width, y: 0.75*height))
        path.addCurve(to: CGPoint(x: 0.81419*width, y: 0.78467*height), control1: CGPoint(x: 0.82338*width, y: 0.76628*height), control2: CGPoint(x: 0.82031*width, y: 0.77783*height))
        path.addCurve(to: CGPoint(x: 0.78702*width, y: 0.79492*height), control1: CGPoint(x: 0.80833*width, y: 0.79151*height), control2: CGPoint(x: 0.79927*width, y: 0.79492*height))
        path.addLine(to: CGPoint(x: 0.17818*width, y: 0.79492*height))
        path.closeSubpath()
        return path
    }
}

struct PasteIconShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.21789*width, y: 0.96855*height))
        path.addLine(to: CGPoint(x: 0.76436*width, y: 0.96855*height))
        path.addCurve(to: CGPoint(x: 0.91274*width, y: 0.92863*height), control1: CGPoint(x: 0.82606*width, y: 0.96855*height), control2: CGPoint(x: 0.87552*width, y: 0.95524*height))
        path.addCurve(to: CGPoint(x: 0.96858*width, y: 0.82206*height), control1: CGPoint(x: 0.94996*width, y: 0.90202*height), control2: CGPoint(x: 0.96858*width, y: 0.8665*height))
        path.addLine(to: CGPoint(x: 0.96858*width, y: 0.27311*height))
        path.addCurve(to: CGPoint(x: 0.91274*width, y: 0.16654*height), control1: CGPoint(x: 0.96858*width, y: 0.22868*height), control2: CGPoint(x: 0.94996*width, y: 0.19316*height))
        path.addCurve(to: CGPoint(x: 0.76488*width, y: 0.12663*height), control1: CGPoint(x: 0.87552*width, y: 0.13993*height), control2: CGPoint(x: 0.82623*width, y: 0.12663*height))
        path.addLine(to: CGPoint(x: 0.75971*width, y: 0.12663*height))
        path.addCurve(to: CGPoint(x: 0.76901*width, y: 0.14567*height), control1: CGPoint(x: 0.76385*width, y: 0.13249*height), control2: CGPoint(x: 0.76695*width, y: 0.13883*height))
        path.addCurve(to: CGPoint(x: 0.77212*width, y: 0.16728*height), control1: CGPoint(x: 0.77108*width, y: 0.15251*height), control2: CGPoint(x: 0.77212*width, y: 0.15971*height))
        path.addLine(to: CGPoint(x: 0.77212*width, y: 0.20646*height))
        path.addCurve(to: CGPoint(x: 0.73799*width, y: 0.27128*height), control1: CGPoint(x: 0.77212*width, y: 0.23258*height), control2: CGPoint(x: 0.76074*width, y: 0.25419*height))
        path.addCurve(to: CGPoint(x: 0.64855*width, y: 0.29655*height), control1: CGPoint(x: 0.71525*width, y: 0.28813*height), control2: CGPoint(x: 0.68543*width, y: 0.29655*height))
        path.addLine(to: CGPoint(x: 0.3337*width, y: 0.29655*height))
        path.addCurve(to: CGPoint(x: 0.24426*width, y: 0.27128*height), control1: CGPoint(x: 0.29716*width, y: 0.29655*height), control2: CGPoint(x: 0.26735*width, y: 0.28813*height))
        path.addCurve(to: CGPoint(x: 0.21013*width, y: 0.20646*height), control1: CGPoint(x: 0.22151*width, y: 0.25419*height), control2: CGPoint(x: 0.21013*width, y: 0.23258*height))
        path.addLine(to: CGPoint(x: 0.21013*width, y: 0.16728*height))
        path.addCurve(to: CGPoint(x: 0.21324*width, y: 0.14567*height), control1: CGPoint(x: 0.21013*width, y: 0.15971*height), control2: CGPoint(x: 0.21117*width, y: 0.15251*height))
        path.addCurve(to: CGPoint(x: 0.22306*width, y: 0.12663*height), control1: CGPoint(x: 0.21565*width, y: 0.13883*height), control2: CGPoint(x: 0.21892*width, y: 0.13249*height))
        path.addLine(to: CGPoint(x: 0.21737*width, y: 0.12663*height))
        path.addCurve(to: CGPoint(x: 0.07003*width, y: 0.16654*height), control1: CGPoint(x: 0.15636*width, y: 0.12663*height), control2: CGPoint(x: 0.10725*width, y: 0.13993*height))
        path.addCurve(to: CGPoint(x: 0.01419*width, y: 0.27311*height), control1: CGPoint(x: 0.0328*width, y: 0.19316*height), control2: CGPoint(x: 0.01419*width, y: 0.22868*height))
        path.addLine(to: CGPoint(x: 0.01419*width, y: 0.82206*height))
        path.addCurve(to: CGPoint(x: 0.07003*width, y: 0.92863*height), control1: CGPoint(x: 0.01419*width, y: 0.8665*height), control2: CGPoint(x: 0.0328*width, y: 0.90202*height))
        path.addCurve(to: CGPoint(x: 0.21789*width, y: 0.96855*height), control1: CGPoint(x: 0.10725*width, y: 0.95524*height), control2: CGPoint(x: 0.15654*width, y: 0.96855*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.3337*width, y: 0.25004*height))
        path.addLine(to: CGPoint(x: 0.64855*width, y: 0.25004*height))
        path.addCurve(to: CGPoint(x: 0.69095*width, y: 0.23869*height), control1: CGPoint(x: 0.66648*width, y: 0.25004*height), control2: CGPoint(x: 0.68061*width, y: 0.24626*height))
        path.addCurve(to: CGPoint(x: 0.70646*width, y: 0.20646*height), control1: CGPoint(x: 0.70129*width, y: 0.23088*height), control2: CGPoint(x: 0.70646*width, y: 0.22013*height))
        path.addLine(to: CGPoint(x: 0.70646*width, y: 0.16801*height))
        path.addCurve(to: CGPoint(x: 0.69095*width, y: 0.13615*height), control1: CGPoint(x: 0.70646*width, y: 0.15434*height), control2: CGPoint(x: 0.70129*width, y: 0.14372*height))
        path.addCurve(to: CGPoint(x: 0.64855*width, y: 0.12443*height), control1: CGPoint(x: 0.68061*width, y: 0.12834*height), control2: CGPoint(x: 0.66648*width, y: 0.12443*height))
        path.addLine(to: CGPoint(x: 0.62167*width, y: 0.12443*height))
        path.addCurve(to: CGPoint(x: 0.58031*width, y: 0.06364*height), control1: CGPoint(x: 0.61891*width, y: 0.1005*height), control2: CGPoint(x: 0.60512*width, y: 0.08024*height))
        path.addCurve(to: CGPoint(x: 0.49138*width, y: 0.03837*height), control1: CGPoint(x: 0.55549*width, y: 0.04679*height), control2: CGPoint(x: 0.52585*width, y: 0.03837*height))
        path.addCurve(to: CGPoint(x: 0.40194*width, y: 0.06364*height), control1: CGPoint(x: 0.45657*width, y: 0.03837*height), control2: CGPoint(x: 0.42676*width, y: 0.04679*height))
        path.addCurve(to: CGPoint(x: 0.3611*width, y: 0.12443*height), control1: CGPoint(x: 0.37713*width, y: 0.08024*height), control2: CGPoint(x: 0.36351*width, y: 0.1005*height))
        path.addLine(to: CGPoint(x: 0.3337*width, y: 0.12443*height))
        path.addCurve(to: CGPoint(x: 0.2913*width, y: 0.13615*height), control1: CGPoint(x: 0.31577*width, y: 0.12443*height), control2: CGPoint(x: 0.30164*width, y: 0.12834*height))
        path.addCurve(to: CGPoint(x: 0.27631*width, y: 0.16801*height), control1: CGPoint(x: 0.28131*width, y: 0.14372*height), control2: CGPoint(x: 0.27631*width, y: 0.15434*height))
        path.addLine(to: CGPoint(x: 0.27631*width, y: 0.20646*height))
        path.addCurve(to: CGPoint(x: 0.2913*width, y: 0.23869*height), control1: CGPoint(x: 0.27631*width, y: 0.22013*height), control2: CGPoint(x: 0.28131*width, y: 0.23088*height))
        path.addCurve(to: CGPoint(x: 0.3337*width, y: 0.25004*height), control1: CGPoint(x: 0.30164*width, y: 0.24626*height), control2: CGPoint(x: 0.31577*width, y: 0.25004*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.49138*width, y: 0.16215*height))
        path.addCurve(to: CGPoint(x: 0.45674*width, y: 0.15226*height), control1: CGPoint(x: 0.47794*width, y: 0.16215*height), control2: CGPoint(x: 0.46639*width, y: 0.15885*height))
        path.addCurve(to: CGPoint(x: 0.44278*width, y: 0.12809*height), control1: CGPoint(x: 0.44744*width, y: 0.14543*height), control2: CGPoint(x: 0.44278*width, y: 0.13737*height))
        path.addCurve(to: CGPoint(x: 0.45674*width, y: 0.10429*height), control1: CGPoint(x: 0.44278*width, y: 0.11882*height), control2: CGPoint(x: 0.44744*width, y: 0.11088*height))
        path.addCurve(to: CGPoint(x: 0.49138*width, y: 0.09403*height), control1: CGPoint(x: 0.46639*width, y: 0.09745*height), control2: CGPoint(x: 0.47794*width, y: 0.09403*height))
        path.addCurve(to: CGPoint(x: 0.52551*width, y: 0.10429*height), control1: CGPoint(x: 0.50483*width, y: 0.09403*height), control2: CGPoint(x: 0.5162*width, y: 0.09745*height))
        path.addCurve(to: CGPoint(x: 0.53946*width, y: 0.12809*height), control1: CGPoint(x: 0.53481*width, y: 0.11088*height), control2: CGPoint(x: 0.53946*width, y: 0.11882*height))
        path.addCurve(to: CGPoint(x: 0.52551*width, y: 0.15226*height), control1: CGPoint(x: 0.53946*width, y: 0.13737*height), control2: CGPoint(x: 0.53481*width, y: 0.14543*height))
        path.addCurve(to: CGPoint(x: 0.49138*width, y: 0.16215*height), control1: CGPoint(x: 0.5162*width, y: 0.15885*height), control2: CGPoint(x: 0.50483*width, y: 0.16215*height))
        path.closeSubpath()
        return path
    }
}
