//
//  Tester.swift
//  collections
//
//  Created by Luat on 5/20/21.
//

import Foundation

struct Tester {
    func removeDups(nums: [Int]) -> [Int] {
        var result: [Int] = []
        var numsSet: Set<Int> = []
        for i in 0..<nums.count {
            numsSet.insert(nums[i])
        }
        for ele in numsSet {
            result.append(ele)
        }
        return result
    }
    
    func findCommonNums(from firstNums: [Int], and secondNums: [Int]) -> [Int] {
        var results: [Int] = []
        var set1: Set<Int> = []
        
        for ele in firstNums {
            set1.insert(ele)
        }
        for ele in set1 {
            if secondNums.contains(ele) {
                results.append(ele)
            }
        }
        return results
    }
    
    // first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        var results: [Character] = []
        var set1: Set<Character> = []
        
        for ele in firstWord {
            set1.insert(ele)
        }
        for ele in set1 {
            if secondWord.contains(ele) {
                results.append(ele)
            }
        }
        return results
    }
    
    
    // Count the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        var result: [Character: Int] = [:]
        for ele in string {
            if result[ele] != nil {
                result[ele]! += 1
            } else if ele != " " {
                result[ele] = 1
            }
        }
        return result
    }
    
    // "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        var mostFrequent: (Character, Int) = ("a", 0)
        var letterDic: [Character: Int] = [:]
        
        for ele in string {
            if letterDic[ele] != nil {
                letterDic[ele]! += 1
            } else if ele != " " {
                letterDic[ele] = 1
            }
        }
        
        for ele in letterDic {
            if ele.1 > mostFrequent.1 {
                mostFrequent = ele
            }
        }
        
            return mostFrequent.0
    }
    
    // O(n) time
    func findPairs(nums: [Int]) -> Int {

      return 0
    }
    
    
    /// Optionals
    /// Unwrap using optional binding: if let
    func unwrap(optional: Int?) -> Int {
        return 0
    }
    
    /// Unwrap using optional binding: guard let
    func unwrap(optional: String?) -> String {
        return ""
    }
    
    /// Unwrap using nil coalescing
    // takes optional array, return first value?
    func unwrap(optional: [Int]?) -> Int {
        
        return 0
    }
    
    /// Unwrap using nil coalescing
    // takes optional dictionary, return value at key?
    func unwrap(optional: [Int: Int]?, key: Int?) -> Int {
        
        return 0
    }
    
    /// Unwrap using optional chaining and optional binding
    // takes nested optional array, return first value?
    func unwrap(optional: [[Int]?]?) -> Int {
        
        return 0
    }
    
    /// Unwrap using implicitly unwrap
    func implicitUnwrap(optional: Int?) -> Int {
        
        return 0
    }
    
}
