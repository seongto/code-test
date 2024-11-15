import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var answer: Set<Int> = []
    
    for idx1 in 0 ..< numbers.count - 1 {
        for idx2 in idx1 + 1 ..< numbers.count {
            answer.insert(numbers[idx1] + numbers[idx2])
        }
    }

    return Array(answer).sorted()
}