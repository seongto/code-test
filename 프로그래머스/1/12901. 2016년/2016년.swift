func solution(_ a:Int, _ b:Int) -> String {
    
    let days:[String] = [ "THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED" ]
    var sumDay:Int = 0
    let month:[Int] = [ 0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30 ]
    
    for num in 0...(a-1) {
        sumDay += month[num]
    }
    
    return days[(sumDay+b) % 7]
}