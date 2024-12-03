import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var answer: Int = 0
    let visitHistory: [Bool] = [Bool](repeating: false, count: dungeons.count)    
    
    func dungeonCrawlling(currentK: Int, currentIdx:Int, depth: Int, sum: Int, visited: [Bool] ) {
        if depth >= dungeons.count || answer == dungeons.count {
            return
        }
        
        var tempK: Int = currentK
        var tempVisited = visited
        var tempSum: Int = sum
        
        if tempVisited[currentIdx] == true {
            return
        } else {
            tempVisited[currentIdx] = true

            if tempK >= dungeons[currentIdx][0] {
                tempK -= dungeons[currentIdx][1]
                tempSum += 1

                if tempSum > answer {
                    answer = tempSum
                }
            }
        }
        
        for i in 0..<dungeons.count  { 
            dungeonCrawlling(currentK: tempK, currentIdx:i ,depth: depth + 1, sum: tempSum, visited: tempVisited)
        } 
    }
    
    for i in 0..<dungeons.count {
        dungeonCrawlling(currentK: k, currentIdx: i, depth: 0, sum: 0, visited: visitHistory )
    }
    
    return answer
}