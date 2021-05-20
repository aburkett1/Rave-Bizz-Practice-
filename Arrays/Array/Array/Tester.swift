//
//  Tester.swift
//  Array
//
//  Created by Luat on 5/19/21.
//

import Foundation

class Tester {
    static let shared = Tester()
    
    // MARK: - QUESTIONS
    /// 1. Write a function that takes an array of numbers and returns an array with each of the numbers multiplied by 2
    func multiplyByTwo(numbers: [Int]) -> [Int]{
        return numbers.map({ num in
            return num * 2
        })
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {
        var newArr: [Int] = []
        for position in Int(ceil(Double(array.count)/2))..<array.count {
            newArr.append(array[position])
        }
        
        return newArr
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
        var result: [Int] = []
        for ele in start...end {
            result.append(ele)
        }
        return result
    }


    /// 5. Create this 2-D array
    /*
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray() -> [[Int]] {
      return [[1,2,3],
              [4,5,6],
              [7,8,9]]
    }

    /// 6. Write a function that returns the number of pairs of elements that sums up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {
        var pairs = 0
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if (nums[i] + nums[j] == 0) {
                    pairs+=1
                }
            }
        }
        return pairs
    }

    //  "hello world"  -> "ellohay orldway"
    func pigLatinSentence(sentence: String) -> String {
        
        func evalPigLatin(word: String) -> String {
            let vowels: [Character] = ["a", "e", "i", "o", "u"]
            if vowels.contains(word[word.startIndex]) {
                return (word + "yay")
            } else {
                return (word.dropFirst() + word.prefix(1) + "ay")
            }
        }
        
        print("Separated sentence:", "hello world".split(separator: " "))
        let splitWords = sentence.split(separator: " ")
        var result = ""
        for i in 0..<splitWords.count {
            result += evalPigLatin(word: String(splitWords[i]))
            if i != splitWords.count-1 {
                result += " "
            }
        }
        return result
    }
    
    
    // return an Array of all positions of the character
    func positionOf(character: Character, in word: String) -> [Int] {
        var result: [Int] = []
//        var wordIndex = word.startIndex
//        for i in 0..<word.count - 1 {
//            wordIndex = word.index(word.startIndex, offsetBy: i)
//            if word[wordIndex] == character {
//                result.append(i)
//            }
//        }
        
        for (pos, ele) in word.enumerated() {
            if ele == character {
                result.append(pos)
            }
        }
        
        return result
    }
    
    /*
        Input: array of character of "I" and "O"
        - "I" -> increase number of chairs required
        - "O" -> decrease number of chairs required
        Output: max chairs required
     */
    func minimumChairs(array: [Character]) -> Int {
        var currNumOfChairs = 0
        var minimumChairsNeeded = 0
        for i in 0..<array.count {
            if array[i] == "I" {
                currNumOfChairs += 1
            } else if array[i] == "O" {
                currNumOfChairs -= 1
            }
            if currNumOfChairs > minimumChairsNeeded {
                minimumChairsNeeded = currNumOfChairs
            }
        }
        return minimumChairsNeeded
    }
    
    /** Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit ( buy price - sell price)
        var prices = [7,1,5,3,6,4]  //returns 5
     */
    func maxProfit(array: [Int]) -> Int {
        var maxProfit = 0
        for i in 0..<array.count {
            for j in i+1..<array.count {
                if j - i > maxProfit {
                    maxProfit = j - i
                }
            }
        }
        return maxProfit
    }
    
    /**
        Input: array of priorities: [1, 4, 8, 4]
        Output: reduce the distance bettwen priorities but keep the same priority ordering
            -> [1, 2, 3, 2]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        
        return []
    }
}
