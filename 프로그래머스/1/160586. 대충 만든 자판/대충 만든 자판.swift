import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var result: [Int] = []
    var keyDict: [Character:Int] = [:]
    var answer: [Int] = []
    
    for word in keymap {
        word.enumerated().forEach {
            if keyDict[$0.1] != nil {
                if $0.0 < keyDict[$0.1]! {
                    keyDict[$0.1] = $0.0
                }
            } else {
                keyDict[$0.1] = $0.0
            }
        }
    }
        
    for word in targets {
        var count: Int = 0
        
        for char in word {
            if keyDict[char] == nil {
                count = -1
                break
            } else {
                count += keyDict[char]! + 1
            }
        }
        
        answer.append(count)
    }
    
    
    return answer
}