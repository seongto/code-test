func solution(_ n:Int64) -> Int64 {
    var arr = Array(String(n))
    arr.sort(by:>)
    var result:String = String(arr)
    
    return Int64(result)!
}