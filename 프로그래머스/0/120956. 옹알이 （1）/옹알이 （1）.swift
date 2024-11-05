import Foundation

func solution(_ babbling:[String]) -> Int {
    var babblings: [String] = babbling
    var arr : [String] = [ "aya", "ye", "woo", "ma" ]
    var answer: Int = 0
    
    for bab in babblings {
        var babb: String = bab
        for word in arr {
            if babb.contains(word) {
                babb = babb.replacingOccurrences(of: word, with: " ")
            }
        }
        
        if babb.filter{!$0.isWhitespace} == "" {
            answer += 1
        }
    }
    
    return answer
}