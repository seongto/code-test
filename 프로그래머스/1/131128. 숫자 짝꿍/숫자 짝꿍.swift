import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var sameNumbers: [String] = []
    var yDict: [Character: Int] = [:]
    
    Y.forEach { 
        yDict[ $0, default: 0 ] += 1
    }
    
    X.forEach {
        if yDict[$0] != nil && yDict[$0]! > 0 {
            sameNumbers.append(String($0))
            yDict[$0]! -= 1
        }
    }
    
    if sameNumbers.count == 0 {
        return "-1"
    } 
    
    sameNumbers.sort(by:>)
    if sameNumbers[0] == "0" {
        return "0"
    } else {
        return sameNumbers.joined(separator: "")
    }
}