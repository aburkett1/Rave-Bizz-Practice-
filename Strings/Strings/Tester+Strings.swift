//
//  Tester+Strings.swift
//  Day1-BasicTypes
//
//  Created by Luat on 5/16/21.
//

import Foundation

extension Tester {

    func printWord(word: String) {
        print(word)
    }
    
    func printUpperCase(word: String) {
        print(word.uppercased())
    }
    
    func printLetters(word: String) {
        for char in word {
            print(char)
        }
    }
    
    func printEveryOtherLetter(word: String) {
        var offSetIndex = word.startIndex
        for i in 0..<word.count {
            if i % 2 == 0 {
                offSetIndex = word.index(offSetIndex, offsetBy: i)
                print(word[offSetIndex])
            }
        }
    }
    
    func isPalindrome(word: String) -> Bool {
        print("Starting function: isPalindrome")
        
        var frontPointer = word.startIndex
        var endPointer = word.index(word.endIndex, offsetBy: -1)
        for i in 0..<word.count/2 {
            frontPointer = word.index(frontPointer, offsetBy: i)
            endPointer = word.index(endPointer, offsetBy: (-i))
            
            print(word, word[frontPointer], word[endPointer])
            
            if word[frontPointer] != word[endPointer] {
                print("Returning Value: False")
                return false
            }
        }
        print("Returning Value: True")
        return true
    }
    
/*
    Pig Latin:
    1) Move the first letter to the end and add "ay"
        pig -> igpay
        latin -> atinay
    2) IF word starts with a vowel, add "yay" to the word
        one -> oneyay
*/
    func printPigLatin(word: String) {
        let vowels: [Character] = ["a", "e", "i", "o", "u"]
        if vowels.contains(word[word.startIndex]) {
            print(word + "yay")
        } else {
            print(word.dropFirst() + word.prefix(1) + "ay")
        }
    }
}
