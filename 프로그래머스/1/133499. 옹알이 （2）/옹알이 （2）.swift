import Foundation

func solution(_ babbling:[String]) -> Int {
    var babblings: [String] = babbling
    var arr : [String] = [ "aya", "ye", "woo", "ma" ]
    var answer: Int = 0
    
    for babItem in babblings {
        var bab: String = babItem
        
        for word in arr {
            guard !bab.contains(word + word) else {
                continue
            }
            
            if bab.contains(word) {
                bab = bab.replacingOccurrences(of: word, with: " ")
            }
        }
        
        if bab.filter{!$0.isWhitespace} == "" {
            answer += 1
        }
    }
    
    return answer
}