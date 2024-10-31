func solution(_ n:Int64) -> [Int] {
    var result:[Int] = []
    
    for num in String(n) {
        result.insert(Int(String(num))!, at:0)
    }
    
    return result
}