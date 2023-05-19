//
//  Game.swift
//  WordNadoFinal
//
//  Created by Kevin Nguyen on 5/17/23.
//

import SwiftUI

struct GameView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = "" // contains the word player has to spell from
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var secondsRemaining = 60
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        NavigationView {
            VStack {
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    Text("\(secondsRemaining) seconds")
                        .font(.headline)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding(.trailing)
                        .onReceive(timer) { _ in
                            if secondsRemaining > 0 {
                                secondsRemaining -= 1
                            }
                        }
                }
                
                
                List {
                    Section { // free text to type in
                        TextField("Enter your word", text: $newWord)
                            .autocapitalization(.none)
                    }
                    
                    Section { // show all their used words
                        ForEach(usedWords, id: \.self) { word in
                            HStack {
                                Image(systemName: "\(word.count).circle.fill")
                                Text(word)
                            }
                        }
                    }
                }
                .navigationTitle(rootWord)
                .onSubmit(addNewWord) // when user press enter, displays the word
                .onAppear(perform: startGame) // shows the random word from startGame
                .alert(errorTitle, isPresented: $showingError) {
                    Button("OK", role: .cancel) { } // button ok and a cancel
                } message: {
                    Text(errorMessage) // what the problem was
                }
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        // make sure theres at least one character in here
        guard answer.count > 0 else { return }
        
        // Extra validation to come
        guard isOriginal(word: answer) else{
            wordError(title: "Word used already", message: "Be more original!")
            return
        }
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation { // animate the word when entered
            usedWords.insert(answer, at: 0)
        }
        // usedWords.insert(answer, at: 0)
        // remove all its item
        newWord = ""
    }
    
    func startGame() { // runs the game by giving a random word from start.txt
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        // this should never happend, but just in case
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word) // if it does not contain the word
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord // copy of rootWord
        
        for letter in word { // get each letter the player enters, does it exist?
            if let pos = tempWord.firstIndex(of: letter) { // if exist, put in pos
                // remove the letter so the letter can't be used again
                tempWord.remove(at: pos)
            } else { // returns false if it doesnt exist
                return false
            }
        }
        // gone over every letetr they entered, return true
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker() // UITextChecker
        // objective c expects to be given with certain range
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en") // read back location of mispelled words
        
        
        // NSNotFound true, if not then return false
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

