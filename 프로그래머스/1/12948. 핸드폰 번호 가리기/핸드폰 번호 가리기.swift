func solution(_ phone_number:String) -> String {
    var string:String = String(phone_number.reversed())
    var answer:String = ""
    
    for (index, num) in string.enumerated() {
        if index < 4 {
            answer = String(num) + answer
        } else {
            answer = "*" + answer
        }
    }
    
    return answer
}