func solution(_ s:String) -> String {
    var arr: [Int] = s.split(separator: " ").map { Int($0)!}
    var maxNum: Int = arr[0]
    var minNum: Int = arr[0]
    
    arr.forEach {
        maxNum = max($0, maxNum)
        minNum = min($0, minNum)
    }
    
    return "\(minNum) \(maxNum)"
}