import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dict: [String:Int] = [:]
    var answer: Int = 1
    
    for c in clothes {
        dict[c[1], default: 1] += 1
    }
    
    answer = dict.values.reduce(answer) { $0 * $1}
    
    return answer - 1
}