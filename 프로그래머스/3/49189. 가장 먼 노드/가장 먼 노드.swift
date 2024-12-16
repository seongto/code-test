import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    var answer: Int = 0
    var record: [Int:Int] = [:]
    var maxRecord = 0
    
    edge.forEach {
        graph[$0[0]].append($0[1])
        graph[$0[1]].append($0[0])
    }

    var visited: [Bool] = Array(repeating: false, count: graph.count)
    var queue: [Int] = [1]
    var distance: Int = 1
    visited[1] = true
    record[1] = 0

    while !queue.isEmpty {
        let node = queue.removeFirst()

        for next in graph[node] {
            if !visited[next] {
                record[next] = record[node]! + 1
                
                if record[next]! > maxRecord {
                    maxRecord = record[next]!
                }
                
                queue.append(next)
                visited[next] = true
            } 
        }
        distance += 1
    }
        
    var filtered = record.filter {
        $0.value == maxRecord
    }    
        
    return filtered.count
}
