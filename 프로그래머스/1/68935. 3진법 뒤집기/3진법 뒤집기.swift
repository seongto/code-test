import Foundation

func solution(_ n:Int) -> Int {
    let binary:String = String(n ,radix: 3)            
    
    return Int(String(binary.reversed()), radix: 3)!
}