import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var cokes:Int = 0
    var bottles:Int = n
   
    
    while bottles >= a {
        cokes = cokes + ((bottles / a) * b)
        bottles = (bottles % a) + ((bottles / a) * b)
    }
    
    
    return cokes
}