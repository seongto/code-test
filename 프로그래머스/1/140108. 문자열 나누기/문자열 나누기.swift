import Foundation

func solution(_ s:String) -> Int {
    var first: Character = " "
    var isFirst: Bool = true
    var amount1: Int = 0
    var amount2: Int = 0
    var answer:Int = 0
    
    s.enumerated().forEach {
        if isFirst {
            isFirst = false
            first = $0.1
        }
        
        if $0.1 == first {
            amount1 += 1
        } else {
            amount2 += 1
        }
        
        if $0.0 == s.count - 1 {
            answer += 1
        } else if amount1 == amount2 {
            answer += 1
            isFirst = true
            amount1 = 0
            amount2 = 0
        }
    }
    
    return answer
}