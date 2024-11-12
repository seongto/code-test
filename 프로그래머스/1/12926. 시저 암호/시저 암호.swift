func solution(_ s:String, _ n:Int) -> String {
    var answer: String = ""
    
    for str in s {
        if let char = str.unicodeScalars.first {
            var isUpper:Bool = char.value <= 90 ? true : false
            var num: Int = Int(char.value)
            
            if num == 32 {
                answer += " "
            } else {
                num += n
                
                if isUpper {
                    if num > 90 { num -= 26 }
                } else {
                    if num > 122 { num -= 26 }
                }
                
                if let numStr = UnicodeScalar(num) {
                    answer += String(numStr)
                }
            }
        }
    }
    
    return answer
}
