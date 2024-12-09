import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var sum: Int = (brown - 4) / 2
    
    for num in 1..<sum {
        if num * (sum - num) == yellow {
            return [ sum - num + 2, num + 2]
        }
    }
    
    return []
}