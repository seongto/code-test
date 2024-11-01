func solution(_ x:Int) -> Bool {
    var sum:Int = 0
    
    for num in String(x) {
        sum += Int(String(num))!
    }
    
    guard x % sum == 0 else {
        return false
    }
    
    return true
}