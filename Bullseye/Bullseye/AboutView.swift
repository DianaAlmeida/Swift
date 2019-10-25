//
//  AboutView.swift
//  Bullseye
//
//  Created by itsector on 23/10/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let beige = Color(red: 255.0 / 255.0, green: 214.0 / 255.0, blue: 179.0 / 255.0)
    
    struct HeadStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT VBold", size: 30))
            .padding(.bottom, 20)
            .padding(.top, 20)
        }
    }
    
    struct TextViewsStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT VBold", size: 16))
            .padding(.bottom, 20)
            .padding(.leading, 60)
            .padding(.trailing, 60)
        }
    }
    
    
    var body: some View {
        Group {
            VStack {
                Text("🎯 Bullseye 🎯").modifier(HeadStyle())
                Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider. ").modifier(TextViewsStyle())
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(TextViewsStyle())
                Text("Enjoy!").modifier(TextViewsStyle())
            }
            .navigationBarTitle("About Bullseye")
            .background(beige)
        }
    .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
