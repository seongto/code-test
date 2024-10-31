import Foundation

func solution(_ n:Int) -> Int {
    var result:Int = 0
    for num in 1...n {
        guard num % 2 == 0 else { continue }
        result += num
    }
    
    return result
}