//
//  ContentView.swift
//  ParallaxEffect_Card
//
//  Created by Sai Krishna on 3/18/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dragOffset: CGSize = .zero
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 450)
                .offset(x: -dragOffset.width / 10, y: -dragOffset.height / 10)
                .scaleEffect(1.2)
            
            Image("profile")
                .resizable()
                .frame(width: 250, height: 250)
                .offset(x: dragOffset.width / 5, y: dragOffset.height / 5)
        }
        .frame(width: 350, height: 450)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .rotation3DEffect(.degrees(Double(dragOffset.width / 10)), axis: (x: 0, y: 0, z: 0))
        .rotation3DEffect(.degrees(Double(-dragOffset.height / 10)), axis: (x: 1, y: 0, z: 0))
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
        
        .gesture(
            DragGesture()
                .onChanged{ value in
                    withAnimation(.interactiveSpring()){
                        dragOffset = value.translation
                    }
                }
                .onEnded{ _ in
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.6)){
                        dragOffset = .zero
                    }
                }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
