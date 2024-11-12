import Foundation

func solution(_ s:String) -> Int {
    var answer: String = s
    let numberToWords: [String: String] = [
        "zero": "0",
        "one": "1",
        "two": "2",
        "three": "3",
        "four": "4",
        "five": "5",
        "six": "6",
        "seven": "7",
        "eight": "8",
        "nine": "9"
    ]
    
    for (key, value) in numberToWords {
        if answer.contains(key) {
            answer = answer.replacingOccurrences(of: key, with: value)
        }
    }
    
    if let result = Int(answer) {
        return result
    }
    
    return 0
}