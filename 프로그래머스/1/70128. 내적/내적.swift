import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var answer: Int = 0
    
    for num in 0...(a.count - 1) {
        answer += a[num] * b[num]
    }
    return answer
}