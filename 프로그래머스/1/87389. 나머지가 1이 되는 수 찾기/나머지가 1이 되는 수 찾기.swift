import Foundation

func solution(_ n:Int) -> Int {
    for num in 1...n {
        if n % num == 1 {
            return num
        }
    }
    return 0
}