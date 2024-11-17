import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var answer: [Int] = []
    
    for idx in 0...score.count - 1 {
        var hall: [Int] = score[0...idx].sorted(by: >)
        if idx < k {
            answer.append(hall.min()!)
        } else {
            answer.append(hall[k-1])
        }
        
    }
    
    return answer
}