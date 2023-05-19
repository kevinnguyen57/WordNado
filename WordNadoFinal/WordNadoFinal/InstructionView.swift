//
//  InstructionView.swift
//  WordNadoFinal
//
//  Created by Kevin Nguyen on 5/17/23.
//


import SwiftUI

struct InstructionView: View {
    
    var body: some View {
        
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    Text("INSTRUCTIONS")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .underline()
                        .padding(50)
                }

                
                Text("Given a random word,")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.black)
                    .padding(2)
                
                Text("use its letters to form as")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.black)
                    .padding(2)
                
                Text("many words as you can")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.black)
                    .padding(2)
                
                Text("within the time limit")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.black)
                    .padding(2)
    
                Spacer()
            }
        
        }
    }
    
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView()
    }
}



