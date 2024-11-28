import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var answer: Int = 0
    var soldiers: Set<Int> = Set(1...number)
    
    for num in 1...number {
        if !soldiers.contains(num) {
            continue
        }
        
        var divCount: Int = 0
        var isOver: Bool = false
        
        
        var i = 1
        while i * i <= num {
            if i * i == num {
                divCount += 1
            } else if num % i == 0 {
                divCount += 2
            }
            
            if divCount > limit {
                isOver = true
                break
            }
            
            i += 1
        }
        
        if isOver {
            answer += power
        } else {
            answer += divCount
        }

        if ( isOver == true ) || ( divCount == limit ) {
            if number / num > 1 {
                for mul in 2...number / num {
                    if soldiers.contains(mul * num){
                        soldiers.remove(mul * num)
                        answer += power
                    }
                }
            }
        }
    }
    
    return answer
}