import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var answer: [Int] = []
    var reports = Set(report)
    var count: [String:Int] = [:]
    var reporters: [String:[String]] = [:]
    
    reports.forEach {
        var arr = $0.split(separator: " ").map { String($0)}
        reporters[arr[1], default: []].append(arr[0])
    }
    
    reporters.forEach {
        if $0.value.count >= k {
            for who in $0.value {
                count[who, default: 0] += 1
            }
        }
    }
    
    id_list.forEach {
        answer.append(count[$0, default: 0])
    }
    
    return answer
}