import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var dict: [Int:Int] = [:]
    var sum: Int = 0
    var answer: Int = 0
    
    tangerine.forEach {
        dict[$0, default: 0] += 1
    }
    
    var arr = dict.sorted {
        $0.value > $1.value        
    }
        
    for tang in arr {
        sum += tang.value
        answer += 1
        
        if sum >= k {
            break
        }
    }
    
    return answer
}