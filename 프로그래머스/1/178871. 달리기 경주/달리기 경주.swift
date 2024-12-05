import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var result: [ String ] = []
    var dict1: [String:Int] = [:]
    var dict2: [Int:String] = [:]
    
    for i in 0..<players.count {
        dict1[players[i]] = i
        dict2[i] = players[i]
    }
    
    callings.forEach {
        var idx: Int = dict1[$0]!
        var ahead: String = idx > 0 ? dict2[idx - 1]! : ""
        
        dict1[$0] = idx - 1
        dict1[ahead] = idx
        
        dict2[idx] = ahead
        dict2[idx - 1] = $0
    }
    
    for i in 0..<players.count {
        result.append(dict2[i]!)
    }
    
    return result
}