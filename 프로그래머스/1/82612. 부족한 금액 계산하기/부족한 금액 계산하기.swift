import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer:Int = money
    
    for c in 1...count {
        answer -= price * c
    }
    
    return Int64( answer >= 0 ? 0 : answer * -1 )
}