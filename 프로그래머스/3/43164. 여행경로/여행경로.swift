import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var answer: [String] = []
    
    func recursive( count: Int, rest: [[String]], visited: [String]){
        if count == 0 {
            if visited.count == tickets.count + 1 {
                if answer.count == 0 {
                    answer = visited
                } else if answer != visited {
                    for i in 1..<visited.count {
                        if visited[i] < answer[i] {
                            answer = visited
                            break
                        } else if visited[i] > answer[i] {
                            break
                        }
                    }
                }
            }
            
            return
        }
        
        if rest.count != count {
            return
        }
        
        for ticket in rest {
            var tempRest: [[String]] = rest
            var tempVisited: [String] = visited
            
            if tempVisited.last == ticket[0] {
                tempVisited.append(ticket[1])
                tempRest.remove(at: Int(rest.firstIndex(of: ticket)!))
            }
            
            recursive(count: count - 1, rest: tempRest, visited: tempVisited)
        }
        
    }
    
    recursive(count: tickets.count, rest: tickets, visited: ["ICN"])
        
    return answer
}