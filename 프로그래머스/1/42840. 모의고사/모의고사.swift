import Foundation

func way1(_ idx: Int, _ answer: Int) -> Bool {
    return answer == (idx % 5) + 1 ? true : false
}

func way2(_ idx: Int, _ answer: Int) -> Bool {
    switch idx % 8 {
    case 1:
        return answer == 1 ? true: false
    case 3:
        return answer == 3 ? true: false
    case 5:
        return answer == 4 ? true: false
    case 7:
        return answer == 5 ? true: false
    default :
        return answer == 2 ? true : false
    }
}

func way3(_ idx: Int, _ answer: Int) -> Bool {
    switch idx % 10 {
    case 0, 1:
        return answer == 3 ? true: false
    case 2, 3:
        return answer == 1 ? true: false
    case 4, 5:
        return answer == 2 ? true: false
    case 6, 7:
        return answer == 4 ? true: false
    default :
        return answer == 5 ? true : false
    }
}


func solution(_ answers:[Int]) -> [Int] {
    var scoreDict: [Int: Int] = [:]
    
    answers.enumerated().forEach {
        scoreDict[1, default: 0] += way1($0, $1) ? 1 : 0
        scoreDict[2, default: 0] += way2($0, $1) ? 1 : 0
        scoreDict[3, default: 0] += way3($0, $1) ? 1 : 0
    }
    
    var sorted = scoreDict.sorted {
        $0.value > $1.value
    }
    
    var highScore: Int = sorted[0].value
    var answer = sorted.filter {
        $0.value == highScore
    }.map { 
        $0.key
    }
    
    
    return answer.sorted()
}