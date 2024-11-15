import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer: [Int] = []
    
    for command in commands {
        var slicedArray = Array(array[ command[0]-1...command[1]-1 ]).sorted()
        print(slicedArray)
        answer.append(slicedArray[command[2]-1])
    }
    
    return answer
}