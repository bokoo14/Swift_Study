//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Bokyung on 2023/03/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                HStack {
                    DiceView(n: 1)
                    DiceView(n: 2)
                }
                .padding(.horizontal)
                Button("Roll") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }.font(.system(size: 50))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .background(.red)
            }
        }
    }
}

struct DiceView: View {
    let n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

