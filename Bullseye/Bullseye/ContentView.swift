//
//  ContentView.swift
//  Bullseye
//
//  Created by itsector on 21/10/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    //    @State var alertIsVisibleKnockButton: Bool = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    let midnightBlue = Color(red: 0.0/255.0, green: 51.0/255.0, blue: 102.0/255.0)
    
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.white)
            .modifier(Shadow())
            .font(Font.custom("Arial Rounded MT VBold", size: 18))
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.yellow)
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
                .modifier(Shadow())
        }
    }
    
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct ButtonLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ButtonSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                //Target row
                HStack {
                    Text("Put the bulleye as close as you can to:").modifier(LabelStyle())
                    Text("\(target)").modifier(ValueStyle())
                }
                Spacer()
                //Slider row
                
                HStack {
                    Text("1").modifier(LabelStyle())
                    Slider(value: $sliderValue, in: 1...100).accentColor(Color.green)
                    Text("100").modifier(LabelStyle())
                }
                Spacer()
                //Button row
                Button(action: {
                    print("Button pressed!")
                    self.alertIsVisible = true
                    self.score = self.score + self.pointsForCurrentROund()
                    self.round += 1
                }) {
                    Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/).modifier(ButtonLargeTextStyle())
                }
                .alert(isPresented: $alertIsVisible) { () -> Alert in
                    //                    let roundedValue = Int(sliderValue.rounded())
                    return Alert(title: Text("\(alertTitle())"), message: Text("The slider's value is \(sliderValueRounded()).\n" +
                        "You scored \(pointsForCurrentROund()) points this round."
                        ), dismissButton: .default(Text("Awesome!")) {
                            self.score = self.score + self.pointsForCurrentROund()
                            self.target = Int.random(in: 1...100)
                        })
                    
                }
                .background(Image("Button")).modifier(Shadow())
                Spacer()
                //Score row
                HStack {
                    
                    Button(action: {
                        self.resetGame()
                    }) {
                        HStack{
                            Image("StartOverIcon")
                            Text("Start Over").modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button")).modifier(Shadow())
                    Spacer()
                    Text("Score:").modifier(LabelStyle())
                    Text("\(score)").modifier(ValueStyle())
                    Spacer()
                    Text("Round:").modifier(LabelStyle())
                    Text("\(round)").modifier(ValueStyle())
                    Spacer()
                    NavigationLink(destination: AboutView()) {
                        HStack{
                            Image("InfoIcon")
                            Text(/*@START_MENU_TOKEN@*/"Info"/*@END_MENU_TOKEN@*/).modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button")).modifier(Shadow())
                }
                .padding(.bottom, 20)
            }
                //            Button(action: {
                //                print("Knock Knock button pressed!")
                //                self.alertIsVisibleKnockButton = true
                //            }) {
                //                Text("Knock knock")
                //            }
                //            .alert(isPresented: $alertIsVisibleKnockButton) { () -> Alert in
                //                return Alert(title: Text("Who's there?"), message: Text("Diana"), dismissButton: .default(Text("Dismiss")))
                //            }
                
                .background(Image("Background"), alignment: .center)
                .accentColor(midnightBlue)
                .navigationBarTitle("Bullseye")
        }
        
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func pointsForCurrentROund() -> Int {
        
        
        let difference: Int = amountOff()
        var awardedPoints: Int = 100 - difference
        /*
         if ( roundedValue > self.target) {
         difference = Int(self.sliderValue.rounded()) - self.target
         } else if (self.target > Int(self.sliderValue.rounded())) {
         difference = self.target - Int(self.sliderValue.rounded())
         } else {
         difference = 0
         } */
        if awardedPoints == 100 {
            awardedPoints += 100
        } else if awardedPoints == 99{
            awardedPoints += 50
        }
        return awardedPoints
    }
    
    func alertTitle() -> String {
        let difference = abs(target - sliderValueRounded())
        let title: String
        if difference == 0 {
            title = "Perfect!"
        } else if (difference < 5){
            title = "You almost had it!"
        } else if ( difference <= 11) {
            title = "Not bad!"
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func resetGame() {
        score = 0
        round = 1
        sliderValue = 50.0
        self.target = Int.random(in: 1...100)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
