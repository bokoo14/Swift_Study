//
//  ContentView.swift
//  BokyungCard
//
//  Created by Bokyung on 2023/03/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.64, green: 0.61, blue: 1.00, opacity: 0.6)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("미모지3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0, height: 150.0)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                
                Text("Hello, I am Bokyung!")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(Color.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "github: bokoo14", imageName: "desktopcomputer")
                InfoView(text: "email me!", imageName: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
