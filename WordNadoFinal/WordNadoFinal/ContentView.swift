//
//  ContentView.swift
//  WordNadoFinal
//
//  Created by Kevin Nguyen on 5/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isNavInstructActive = false
    @State private var isNavStartActive = false
    
    @State private var isOn = false
    @State private var isOn1 = false
    @State private var isOn2 = false
    @State private var isOn3 = false
    
    @State private var value = 0
    
    var body: some View {
        
        NavigationView {
            
            ZStack { // using ZStack for background style
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack { // showing the wording of our homepage
                    HStack {
                        Text("Word")
                            .foregroundColor(.white)
                            //.font(.largeTitle)
                            .font(.system(size: 45))
                            .fontWeight(.black)
                            .padding(-7)
                        
                        Text("Nado")
                            .foregroundColor(.green)
                            //.font(.largeTitle)
                            .font(.system(size: 45))
                            .fontWeight(.black)
                            .padding(-6)
                        
                    }.padding(80)
                    
                    Text("Daily Word Challenge")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.heavy)
                        .underline()
                        .padding()
                    
                    HStack {
                        Text("Time Limit: ")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("1:00")
                            .foregroundColor(.green)
                            .font(.title2)
                            .fontWeight(.black)
                    }.padding(0)
                    
                    Button(action: {
                        // Action to perform when the button is tapped
                        isNavInstructActive = true
                        // print("Button tapped!")
                    }) {
                        Text("INSTRUCTIONS")
                            .font(.title2)
                            .foregroundColor(.green)
                            .fontWeight(.black)
                            .padding(8)
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    .padding(25)
                    
                    NavigationLink(
                        destination: InstructionView(),
                        isActive: $isNavInstructActive,
                        label: { EmptyView() }
                    )
                    .hidden()
                    
                    Button(action: {
                        // Action to perform
                        isNavStartActive = true
                        // print("Button tapped!")
                    }) {
                        Text("START")
                            .font(.title2)
                            .foregroundColor(.white)
                            .fontWeight(.black)
                            .padding(10)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(
                        destination: GameView(),
                        isActive: $isNavStartActive,
                        label: { EmptyView() }
                    )
                        
                    Spacer()
                    
                    HStack {
                        NavigationLink(destination: self.teamView()) {
                            Label(" Team   ", systemImage: "person.2.circle.fill")
                                .padding(12)
                                .background(Color.white)
                                .foregroundColor(.green)
                                .cornerRadius(10)
                        }
                        NavigationLink(destination: self.scoreView()) {
                            Label("Scores  ", systemImage: "trophy.fill")
                                .padding(12)
                                .background(Color.white)
                                .foregroundColor(.green)
                                .cornerRadius(10)
                        }
                        NavigationLink(destination: self.settingsView()) {
                            Label("Settings", systemImage: "gearshape.fill")
                                .padding(12)
                                .background(Color.white)
                                .foregroundColor(.green)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    .navigationBarTitle("Home")
                    
                }
            }
        }
        .navigationTitle("My App")
    }
    
    
    func teamView() -> some View {
        
        ZStack { // using ZStack for background style
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("TEAM")
                    .foregroundColor(.green)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .underline()
                    .padding(20)
                
                HStack {
                    Text("Kevin Nguyen")
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    
                    Text("David Pham")
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                }
                Spacer()
                
                Text("ABOUT")
                    .foregroundColor(.green)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .underline()
                    .padding(20)
                
                VStack {
                    Text("WordNado is our project for CPSC 411 IOS Mobile Development Class. It is a replicate of a world wide popular game called Anagrams which is basically a word game. We hope you enjoy our app WordNado, and hopefully we will continue to develop this app to perfect it.")
                    
                }
                .foregroundColor(.white)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(10)
                Spacer()
            
            }
        }
    }
    
    func scoreView() -> some View {
        ZStack { // using ZStack for background style
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Word")
                        .foregroundColor(.white)
                    //.font(.largeTitle)
                        .font(.system(size: 45))
                        .fontWeight(.black)
                        .padding(-7)
                    
                    Text("Nado")
                        .foregroundColor(.green)
                    //.font(.largeTitle)
                        .font(.system(size: 45))
                        .fontWeight(.black)
                        .padding(-6)
                    
                }.padding(30)
                
                Text("Score Board")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .underline()
                    .padding(20)
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 350, height: 450)
                    .cornerRadius(10)
                
                Label("", systemImage: "trophy.fill")
                    .padding(30)
                    .foregroundColor(.yellow)
                
                Spacer()
            }
        
            
        }
    }
    
    func settingsView() -> some View {
        ZStack { // using ZStack for background style
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                Label("Settings", systemImage: "gearshape.fill")
                    .padding(12)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .cornerRadius(10)
                
                Spacer()
                
                List {
                    Toggle("Setting_1", isOn: $isOn)
                        .padding()
                    Toggle("Setting_2", isOn: $isOn1)
                        .padding()
                    Toggle("Setting_3", isOn: $isOn2)
                        .padding()
                    Toggle("Setting_4", isOn: $isOn3)
                        .padding()
                    Stepper("Brightness: \(value)", value: $value)
                        .padding()
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
