import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var dict:[String: Int] = [:]
    var sum: Int = number.reduce(0, +)
    var answer: Int = 0
        
    for i in 0..<want.count {
        dict[want[i]] = number[i]
    }
    
    for i in 0...discount.count - 10 {
        var temp:[String: Int] = dict
        var count: Int = 0
        
        for j in 0...9 {
            var item: String = discount[i + j]
            if temp[item] != nil && temp[item]! > 0 {
                temp[item]! -= 1
                count += 1
            }
        }
        
        if count == sum {
            answer += 1
        }
    }
    
    return answer
}