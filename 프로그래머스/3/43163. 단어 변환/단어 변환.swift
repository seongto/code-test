import Foundation


func compareWords(_ word1: String, _ word2: String) -> Bool {
    var diffCount: Int = 0
    let arr1 = word1.map { String($0)}
    let arr2 = word2.map { String($0)}
    
    for i in 0..<arr1.count {
        if arr1[i] != arr2[i] {
            diffCount += 1
        }
        
        if diffCount > 1 {
            return false
        }
    }
    
    return diffCount == 1 ? true : false
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    guard words.contains(target) else { return 0 }
    
    var temp: [String] = [begin] + words
    var visited = Array(repeating: false, count: temp.count)
    var graph: [[Int]] = Array(repeating: [], count: temp.count)
    var record: [Int:Int] = [:]
    
    for i in 0..<temp.count - 1 {
        for j in i + 1..<temp.count {
            if compareWords(temp[i], temp[j]) {
                graph[i].append(j)
                graph[j].append(i)
            }
        }
    }
        
    var queue: [Int] = [0]
    visited[0] = true
    record[0] = 0
        
    while !queue.isEmpty {        
        let node = queue.removeFirst()
        
        if !graph[node].isEmpty {
            for next in graph[node] {
                record[next] = record[node]! + 1

                if temp[next] == target {
                    return record[next]!
                }

                if !visited[next] {
                    queue.append(next)
                    visited[next] = true
                }
            }       
        }  
    }
    
    return 0
}