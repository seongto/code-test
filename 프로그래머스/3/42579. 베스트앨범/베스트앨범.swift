import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var genresSum: [String:Int] = [:]
    var genres1st: [String:Int] = [:]
    var genres2nd: [String:Int] = [:]
    var genresCount: [String:Int] = [:]
    var answer: [Int] = []
    
    genres.enumerated().forEach { (idx, item) in
        genresSum[item, default: 0 ] += plays[idx]
        genresCount[item, default: 0 ] += 1
        
        if genres1st[item] == nil {
            genres1st[item] = idx
        } else if plays[idx] > plays[genres1st[item]!] {
            genres2nd[item] = genres1st[item]
            genres1st[item] = idx
        } else if genres2nd[item] == nil {
            genres2nd[item] = idx
        } else if plays[idx] > plays[genres2nd[item]!] {
            genres2nd[item] = idx
        }
        
    }
    
    var sorted = genresSum.sorted { $0.1 > $1.1 }
        
    sorted.forEach { item in
        answer.append(genres1st[item.key]!)
        
        if genresCount[item.key]! > 1 {
            answer.append(genres2nd[item.key]!)
        }
    }
    
    return answer
}