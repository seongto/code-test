func solution(_ arr:[Int]) -> Double {
    var sum:Int = 0
    
    for num in arr {
        sum += num
    }
    
    return Double(sum) / Double(arr.count)
}