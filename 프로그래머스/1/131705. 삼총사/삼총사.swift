import Foundation

func solution(_ number:[Int]) -> Int {
    var answer:Int = 0
    var length:Int = number.count - 1
    
    for idx1 in 0...length - 2 {
        for idx2 in (idx1 + 1)...length - 1 {
            for idx3 in (idx2 + 1)...length {
                if number[idx1] + number[idx2] + number[idx3] == 0 {
                    answer += 1
                }
            }
        }
    }
    
    return answer
}