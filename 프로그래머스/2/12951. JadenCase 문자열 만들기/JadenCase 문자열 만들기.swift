func solution(_ s:String) -> String {
    var isFirst: Bool = true
    var result: String = ""
    
    s.forEach {
        if $0 == " " {
            isFirst = true
            result += String($0)
        } else {
            if isFirst {
                result += $0.uppercased()
                isFirst = false
            } else {
                result += $0.lowercased()
            }
        }
    }
    
    return result
}