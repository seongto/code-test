import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var rented: Int = 0
    var restReserve: [Int: Bool] = [:]
    var sorted: [Int] = lost.sorted()
    var rest: [Int] = []
    
    
    reserve.forEach {
        restReserve[$0] = true
    }
        
    for num in sorted {
        if restReserve[num] != nil && restReserve[num]! == true {
            restReserve[num] = false
            rented += 1
        } else {
            rest.append(num)
        }
    }
    
    for num in rest {
        if num > 1 && restReserve[num - 1] != nil && restReserve[num - 1] == true {
            restReserve[num - 1] = false
            rented += 1
        } else if num < n && restReserve[num + 1] != nil && restReserve[num + 1]! == true {
            restReserve[num + 1] = false
            rented += 1
        }
    }
    
    return n - lost.count + rented
}