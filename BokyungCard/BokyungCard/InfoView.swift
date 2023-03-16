//
//  InfoView.swift
//  BokyungCard
//
//  Created by Bokyung on 2023/03/16.
//

import SwiftUI

// extract subview
struct InfoView: View {
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(Color.white)
            .frame(height: 40)
            .overlay(HStack {
                Image(systemName: imageName)
                Text(text)
            })
            //.padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "github: bokoo14", imageName: "desktopcomputer")
            .previewLayout(.sizeThatFits)
    }
}
