import Foundation

func solution(_ n:Int64) -> Int64 {
    var result:Double = sqrt(Double(n))
    
    guard result.truncatingRemainder(dividingBy: 1) == 0 else {
        return -1
    }
    
    return Int64(pow(result + 1, 2))
}