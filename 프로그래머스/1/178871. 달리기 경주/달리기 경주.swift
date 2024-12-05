import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var result: [ String ] = players
    var dict: [String:Int] = [:]
    
    for i in 0..<players.count {
        dict[players[i]] = i
    }
    
    callings.forEach {
        var idx: Int = dict[$0]!
        var ahead: String = result[idx - 1]
        
        result.swapAt(idx, idx - 1)
        
        dict[$0] = idx - 1
        dict[ahead] = idx
    }

    return result
}