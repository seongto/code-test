func solution(_ s:String) -> Bool {
    guard Int(s) != nil else {
        return false
    }
    
    guard s.count == 4 || s.count == 6 else {
        return false
    }
    return true
}