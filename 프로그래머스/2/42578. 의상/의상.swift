import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dict: [String:Int] = [:]
    var answer: Int = 1
    
    for c in clothes {
        dict[c[1], default: 0] += 1
    }
    
    for (key, value) in dict {
        answer = answer * (value + 1)
    }
    
    return answer - 1
}