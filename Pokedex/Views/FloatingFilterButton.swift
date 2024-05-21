//
//  FloatingFilterButton.swift
//  Pokedex
//
//  Created by Bruno  on 20/05/24.
//

import SwiftUI

struct FloatingFilterButton: View {
    var imageName: String
    var heigth: CGFloat = 24
    var width: CGFloat = 24
    var backgroundColor: Color = .purple
    @Binding var show: Bool
    
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Image(imageName)
                .resizable()
                .frame(width: width, height: heigth)
                .padding(16)
        }
        .background(backgroundColor)
        .foregroundColor(.white)
        .clipShape(Circle())
        .shadow(color: .black, radius: 30, x: 0.0, y: 0.0)
    }
}

#Preview {
    FloatingFilterButton(imageName: "", show: .constant(true), action: {
        print("Hello")
    })
}
