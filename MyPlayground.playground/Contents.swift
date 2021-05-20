import UIKit



// Strings

var greeting = "Hello, playground"
var string: String = "a"
var char: Character = "a"

//
for char in string {
    print(char)
}

for (index, value) in string.enumerated() {
    print("Position: \(index), Char: \(value)")
}

//range
for num in 0...5 {
    print(num)
}

for i in 0..<greeting.count {
    print(i)
}

for num in stride(from: 2, to: 10, by: 2) {
    print(num)
}

for num in stride(from: 10, to: 0, by: -1) {
    print(num)
}


let myStartIndex = greeting.startIndex

let myOffsetIndex = greeting.index(myStartIndex, offsetBy: 3)

print(greeting[myOffsetIndex])



//Doubles
ceil(Double([1,2,3].count)/2)



//Arrays
//Must define Array as Any if using multiple data types
let firstArry: [Any] = [
    1,
    "2",
    [5.7]
]


//for let, you cannot mutate an array in any way
let simple = [1,2,3,4]
simple.append(5) //can't
simple[0] = 10 //can't


//Functions

