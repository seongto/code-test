import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    if score.count < m {
        return 0
    }
    
    var answer: Int = 0
    var sorted = score.sorted(by: >)
    
    for num in 1...sorted.count / m {
        var result:Int = sorted[(num * m) - 1]
        
        answer += result * m
    }
    
    return answer
}