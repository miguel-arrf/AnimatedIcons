//
//  ContentView.swift
//  AnimatedIcons
//
//  Created by Miguel Ferreira on 16/01/2023.
//

import SwiftUI

struct ContentView: View {

    @State var animateSwatchPalette = false
    @State var animateEyedropper = false
    @State var animateBackArrow = false
    @State var animateSquaredSparkles = false


    var body: some View {
        ZStack {
            Color(red: 0.95, green: 0.95, blue: 0.95, opacity: 1.0) // #f3f3f3
            HStack(alignment: .center, spacing: 20){
                SwatchPalette(animate: $animateSwatchPalette)
                Eyedropper(animate: $animateEyedropper)
                BackArrow(animate: $animateBackArrow)
                SquaredSparkles(animate: $animateSquaredSparkles)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 15)
            )
        }
        .scaleEffect(2)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation{
                    animateSwatchPalette.toggle()
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                withAnimation{
                    animateEyedropper.toggle()
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                withAnimation{
                    animateBackArrow.toggle()
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                withAnimation{
                    animateSquaredSparkles.toggle()
                }
            }

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension AnyTransition {
    static var blurTransition: AnyTransition { get {
        AnyTransition.modifier(
            active: MyBlurModifier(blur: 1),
            identity: MyBlurModifier(blur: 0))
        }
    }
}

struct MyBlurModifier: ViewModifier {
    let blur: Double

    func body(content: Content) -> some View {
        content.blur(radius: blur)
    }
}
