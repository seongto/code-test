import Foundation

func solution(_ num1:Int, _ num2:Int) -> Int {
    var result:Float = (Float(num1) / Float(num2)) * 1000
    return Int(result)
}