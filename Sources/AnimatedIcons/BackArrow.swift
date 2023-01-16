//
//  BackArrow.swift
//  AnimatedIcons
//
//  Created by Miguel Ferreira on 16/01/2023.
//

import SwiftUI

public struct BackArrow: View {

    @State var hovering : Bool = false

    var springyAnimation = Animation.interpolatingSpring(mass: 0.07, stiffness: 1.63, damping: 1.73, initialVelocity: 9.50)

    @State var id1 = UUID()
    @State var id2 = UUID()

    @Binding var animate : Bool

    init(animate : Binding<Bool> = .constant(false)){
        self._animate = animate
    }


    public var body: some View {
        ZStack {
            ZStack{
                if !hovering {
                    ArrowshapeTurnUpBackwardShape()
                        .frame(width: 14, height: 13)
                        .id(id1)
                        .foregroundColor(.black)
                        .transition(.asymmetric(insertion: .offset(x:30).combined(with: .scale).combined(with: .blurTransition), removal: .offset(x:-30).combined(with: .scale).combined(with: .blurTransition)))
                        .zIndex(1)
                }
                if hovering{
                    ArrowshapeTurnUpBackwardShape()
                        .frame(width: 14, height: 13)
                        .id(id2)
                        .foregroundColor(.black)
                        .transition(.asymmetric(insertion: .offset(x:30).combined(with: .scale).combined(with: .blurTransition), removal: .offset(x:-30).combined(with: .scale).combined(with: .blurTransition)))
                        .zIndex(2)
                }

            }


        }
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
        withAnimation(.spring()){
            hovering = true
            id1 = UUID()
            id2 = UUID()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.spring()){
                hovering = false
                id1 = UUID()
                id2 = UUID()
            }
        }
    }

}

struct BackArrow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BackArrow()
        }
    }
}


struct ArrowshapeTurnUpBackwardShape: Shape {
    func path(in rect: CGRect) -> Path {
            var path = Path()
            let width = rect.size.width
            let height = rect.size.height
            path.move(to: CGPoint(x: 0.48394*width, y: 0.96608*height))
            path.addCurve(to: CGPoint(x: 0.54941*width, y: 0.93786*height), control1: CGPoint(x: 0.51001*width, y: 0.96608*height), control2: CGPoint(x: 0.53183*width, y: 0.95667*height))
            path.addCurve(to: CGPoint(x: 0.57622*width, y: 0.8694*height), control1: CGPoint(x: 0.56729*width, y: 0.91936*height), control2: CGPoint(x: 0.57622*width, y: 0.89654*height))
            path.addLine(to: CGPoint(x: 0.57622*width, y: 0.74774*height))
            path.addLine(to: CGPoint(x: 0.5793*width, y: 0.74774*height))
            path.addCurve(to: CGPoint(x: 0.68213*width, y: 0.76763*height), control1: CGPoint(x: 0.62002*width, y: 0.74774*height), control2: CGPoint(x: 0.6543*width, y: 0.75437*height))
            path.addCurve(to: CGPoint(x: 0.75156*width, y: 0.81852*height), control1: CGPoint(x: 0.70996*width, y: 0.78058*height), control2: CGPoint(x: 0.73311*width, y: 0.79754*height))
            path.addCurve(to: CGPoint(x: 0.79858*width, y: 0.88513*height), control1: CGPoint(x: 0.77031*width, y: 0.83948*height), control2: CGPoint(x: 0.78598*width, y: 0.86169*height))
            path.addCurve(to: CGPoint(x: 0.83989*width, y: 0.93878*height), control1: CGPoint(x: 0.81177*width, y: 0.91011*height), control2: CGPoint(x: 0.82554*width, y: 0.92799*height))
            path.addCurve(to: CGPoint(x: 0.89263*width, y: 0.95544*height), control1: CGPoint(x: 0.85454*width, y: 0.94989*height), control2: CGPoint(x: 0.87212*width, y: 0.95544*height))
            path.addCurve(to: CGPoint(x: 0.96118*width, y: 0.90641*height), control1: CGPoint(x: 0.9228*width, y: 0.95544*height), control2: CGPoint(x: 0.94566*width, y: 0.93909*height))
            path.addCurve(to: CGPoint(x: 0.98447*width, y: 0.75792*height), control1: CGPoint(x: 0.97671*width, y: 0.87372*height), control2: CGPoint(x: 0.98447*width, y: 0.82422*height))
            path.addCurve(to: CGPoint(x: 0.95678*width, y: 0.55161*height), control1: CGPoint(x: 0.98447*width, y: 0.68051*height), control2: CGPoint(x: 0.97524*width, y: 0.61174*height))
            path.addCurve(to: CGPoint(x: 0.87681*width, y: 0.39941*height), control1: CGPoint(x: 0.93863*width, y: 0.49147*height), control2: CGPoint(x: 0.91197*width, y: 0.44074*height))
            path.addCurve(to: CGPoint(x: 0.74936*width, y: 0.30551*height), control1: CGPoint(x: 0.84194*width, y: 0.35809*height), control2: CGPoint(x: 0.79946*width, y: 0.32679*height))
            path.addCurve(to: CGPoint(x: 0.5793*width, y: 0.27359*height), control1: CGPoint(x: 0.69927*width, y: 0.28423*height), control2: CGPoint(x: 0.64258*width, y: 0.27359*height))
            path.addLine(to: CGPoint(x: 0.57622*width, y: 0.27359*height))
            path.addLine(to: CGPoint(x: 0.57622*width, y: 0.14823*height))
            path.addCurve(to: CGPoint(x: 0.54941*width, y: 0.07931*height), control1: CGPoint(x: 0.57622*width, y: 0.12079*height), control2: CGPoint(x: 0.56729*width, y: 0.09781*height))
            path.addCurve(to: CGPoint(x: 0.48394*width, y: 0.05109*height), control1: CGPoint(x: 0.53183*width, y: 0.0605*height), control2: CGPoint(x: 0.51001*width, y: 0.05109*height))
            path.addCurve(to: CGPoint(x: 0.43999*width, y: 0.06127*height), control1: CGPoint(x: 0.46841*width, y: 0.05109*height), control2: CGPoint(x: 0.45376*width, y: 0.05448*height))
            path.addCurve(to: CGPoint(x: 0.39429*width, y: 0.0955*height), control1: CGPoint(x: 0.42651*width, y: 0.06774*height), control2: CGPoint(x: 0.41128*width, y: 0.07915*height))
            path.addLine(to: CGPoint(x: 0.04053*width, y: 0.43688*height))
            path.addCurve(to: CGPoint(x: 0.01899*width, y: 0.47019*height), control1: CGPoint(x: 0.03115*width, y: 0.44613*height), control2: CGPoint(x: 0.02397*width, y: 0.45724*height))
            path.addCurve(to: CGPoint(x: 0.01152*width, y: 0.50858*height), control1: CGPoint(x: 0.01401*width, y: 0.48283*height), control2: CGPoint(x: 0.01152*width, y: 0.49563*height))
            path.addCurve(to: CGPoint(x: 0.01943*width, y: 0.54698*height), control1: CGPoint(x: 0.01152*width, y: 0.52061*height), control2: CGPoint(x: 0.01416*width, y: 0.53341*height))
            path.addCurve(to: CGPoint(x: 0.04141*width, y: 0.58075*height), control1: CGPoint(x: 0.02471*width, y: 0.56024*height), control2: CGPoint(x: 0.03203*width, y: 0.57149*height))
            path.addLine(to: CGPoint(x: 0.39429*width, y: 0.92213*height))
            path.addCurve(to: CGPoint(x: 0.43823*width, y: 0.95544*height), control1: CGPoint(x: 0.40981*width, y: 0.93755*height), control2: CGPoint(x: 0.42446*width, y: 0.94865*height))
            path.addCurve(to: CGPoint(x: 0.48394*width, y: 0.96608*height), control1: CGPoint(x: 0.4523*width, y: 0.96253*height), control2: CGPoint(x: 0.46753*width, y: 0.96608*height))
            path.closeSubpath()
            path.move(to: CGPoint(x: 0.4457*width, y: 0.76578*height))
            path.addCurve(to: CGPoint(x: 0.43867*width, y: 0.76208*height), control1: CGPoint(x: 0.44336*width, y: 0.76578*height), control2: CGPoint(x: 0.44102*width, y: 0.76455*height))
            path.addLine(to: CGPoint(x: 0.19038*width, y: 0.51645*height))
            path.addCurve(to: CGPoint(x: 0.18687*width, y: 0.51228*height), control1: CGPoint(x: 0.18862*width, y: 0.51491*height), control2: CGPoint(x: 0.18745*width, y: 0.51352*height))
            path.addCurve(to: CGPoint(x: 0.18599*width, y: 0.50858*height), control1: CGPoint(x: 0.18628*width, y: 0.51105*height), control2: CGPoint(x: 0.18599*width, y: 0.50982*height))
            path.addCurve(to: CGPoint(x: 0.19038*width, y: 0.50072*height), control1: CGPoint(x: 0.18599*width, y: 0.50642*height), control2: CGPoint(x: 0.18745*width, y: 0.5038*height))
            path.addLine(to: CGPoint(x: 0.43867*width, y: 0.25463*height))
            path.addCurve(to: CGPoint(x: 0.44219*width, y: 0.25278*height), control1: CGPoint(x: 0.43984*width, y: 0.2537*height), control2: CGPoint(x: 0.44102*width, y: 0.25308*height))
            path.addCurve(to: CGPoint(x: 0.4457*width, y: 0.25231*height), control1: CGPoint(x: 0.44336*width, y: 0.25247*height), control2: CGPoint(x: 0.44453*width, y: 0.25231*height))
            path.addCurve(to: CGPoint(x: 0.45361*width, y: 0.2611*height), control1: CGPoint(x: 0.45098*width, y: 0.25231*height), control2: CGPoint(x: 0.45361*width, y: 0.25524*height))
            path.addLine(to: CGPoint(x: 0.45361*width, y: 0.39988*height))
            path.addCurve(to: CGPoint(x: 0.46724*width, y: 0.41422*height), control1: CGPoint(x: 0.45361*width, y: 0.40944*height), control2: CGPoint(x: 0.45815*width, y: 0.41422*height))
            path.addLine(to: CGPoint(x: 0.5125*width, y: 0.41422*height))
            path.addCurve(to: CGPoint(x: 0.62984*width, y: 0.42717*height), control1: CGPoint(x: 0.55498*width, y: 0.41422*height), control2: CGPoint(x: 0.59409*width, y: 0.41853*height))
            path.addCurve(to: CGPoint(x: 0.7252*width, y: 0.46556*height), control1: CGPoint(x: 0.66558*width, y: 0.4355*height), control2: CGPoint(x: 0.69737*width, y: 0.44829*height))
            path.addCurve(to: CGPoint(x: 0.79683*width, y: 0.53125*height), control1: CGPoint(x: 0.75332*width, y: 0.48283*height), control2: CGPoint(x: 0.7772*width, y: 0.50473*height))
            path.addCurve(to: CGPoint(x: 0.84165*width, y: 0.62469*height), control1: CGPoint(x: 0.81646*width, y: 0.55777*height), control2: CGPoint(x: 0.83139*width, y: 0.58892*height))
            path.addCurve(to: CGPoint(x: 0.85747*width, y: 0.74589*height), control1: CGPoint(x: 0.8522*width, y: 0.66016*height), control2: CGPoint(x: 0.85747*width, y: 0.70055*height))
            path.addCurve(to: CGPoint(x: 0.85483*width, y: 0.74959*height), control1: CGPoint(x: 0.85747*width, y: 0.74836*height), control2: CGPoint(x: 0.85659*width, y: 0.74959*height))
            path.addCurve(to: CGPoint(x: 0.85264*width, y: 0.74866*height), control1: CGPoint(x: 0.85396*width, y: 0.74959*height), control2: CGPoint(x: 0.85322*width, y: 0.74928*height))
            path.addCurve(to: CGPoint(x: 0.85088*width, y: 0.74589*height), control1: CGPoint(x: 0.85205*width, y: 0.74805*height), control2: CGPoint(x: 0.85146*width, y: 0.74712*height))
            path.addCurve(to: CGPoint(x: 0.77749*width, y: 0.65846*height), control1: CGPoint(x: 0.83301*width, y: 0.70826*height), control2: CGPoint(x: 0.80854*width, y: 0.67912*height))
            path.addCurve(to: CGPoint(x: 0.66543*width, y: 0.61544*height), control1: CGPoint(x: 0.74673*width, y: 0.6378*height), control2: CGPoint(x: 0.70937*width, y: 0.62346*height))
            path.addCurve(to: CGPoint(x: 0.5125*width, y: 0.60295*height), control1: CGPoint(x: 0.62149*width, y: 0.60712*height), control2: CGPoint(x: 0.57051*width, y: 0.60295*height))
            path.addLine(to: CGPoint(x: 0.46724*width, y: 0.60295*height))
            path.addCurve(to: CGPoint(x: 0.45361*width, y: 0.61729*height), control1: CGPoint(x: 0.45815*width, y: 0.60295*height), control2: CGPoint(x: 0.45361*width, y: 0.60773*height))
            path.addLine(to: CGPoint(x: 0.45361*width, y: 0.75606*height))
            path.addCurve(to: CGPoint(x: 0.4457*width, y: 0.76578*height), control1: CGPoint(x: 0.45361*width, y: 0.76254*height), control2: CGPoint(x: 0.45098*width, y: 0.76578*height))
            path.closeSubpath()
            return path
        }
}

