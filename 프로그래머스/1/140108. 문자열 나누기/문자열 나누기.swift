import Foundation

func solution(_ s:String) -> Int {
    var first: Character = " "
    var isFirst: Bool = true
    var count: Int = 0
    var answer:Int = 0
    
    s.enumerated().forEach {
        if isFirst {
            isFirst = false
            first = $0.1
        }
        
        if $0.1 == first {
            count += 1
        } else {
            count -= 1
        }
        
        if $0.0 == s.count - 1 {
            answer += 1
        } else if count == 0 {
            answer += 1
            isFirst = true
            count = 0
        }
    }
    
    return answer
}