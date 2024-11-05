func solution(_ s:String) -> String {
    var text: [String] = s.map { String($0) }
    
    if text.count % 2 == 0 {        
        return text[s.count / 2 - 1] + text[s.count / 2]
    } else {
        return text[s.count / 2]
    }
}