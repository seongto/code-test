import Foundation

func solution(_ s:String) -> [Int] {
    var result: String = s
    var count: Int = 0
    var removed: Int = 0
        
    while result != "1" {
        var after: String = result.filter { $0 == "1"}
        removed += result.count - after.count
                
        result = String(after.count, radix: 2)
        count += 1
    }
    
    return [count, removed]
}