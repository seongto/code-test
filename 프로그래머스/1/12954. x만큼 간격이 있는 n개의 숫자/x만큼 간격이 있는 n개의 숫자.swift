func solution(_ x:Int, _ n:Int) -> [Int] {
    
    var result:[Int] = []
    
    for num in 1...n {
        result.append(x * num)
    }
    
    return result
}