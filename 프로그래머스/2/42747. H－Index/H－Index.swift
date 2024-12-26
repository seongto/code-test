import Foundation

func solution(_ citations:[Int]) -> Int {
    let sorted = citations.sorted(by: >)
    var result = 0

    for i in 0..<sorted.count {
        if i + 1 <= sorted[i] {
            result = i + 1
        } else {
            break
        }
    }

    return result
}