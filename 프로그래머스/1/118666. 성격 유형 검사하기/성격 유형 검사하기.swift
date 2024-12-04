import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var answer: String = ""
    var dict: [Character:Int] = [:]
    let types: [String] = [ "RT", "CF", "JM", "AN"]
    
    for i in 0..<survey.count {
        
        switch choices[i] {
            case 1...3 :
                dict[survey[i].first!, default: 0] += 4 - choices[i]                
            case 5...7 :
                dict[survey[i].last!, default: 0] += choices[i] - 4
            default :
                continue
        }
    }
    
    func compareType(_ type: String) {
        var sorted: [Character] = type.sorted()
        
        var type1: Int = dict[sorted[0]] ?? 0
        var type2: Int = dict[sorted[1]] ?? 0
        
        answer += String(type1 >= type2 ? sorted[0] : sorted[1])
    }
    
    types.forEach {
        compareType($0)
    }
    
    return answer
}