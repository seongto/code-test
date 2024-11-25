import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var lastPainted: Int = section[0] - 1
    var count: Int = 0
    
    section.forEach {
        if $0 > lastPainted {
            
            lastPainted = $0 + m - 1
            count += 1
        }
    }
    
    return count
}