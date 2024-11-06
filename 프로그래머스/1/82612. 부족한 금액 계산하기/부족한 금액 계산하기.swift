import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var sum:Int = (count * (count+1) * price) / 2
    var answer:Int = money - sum
    
    return Int64( answer >= 0 ? 0 : answer * -1 )
}