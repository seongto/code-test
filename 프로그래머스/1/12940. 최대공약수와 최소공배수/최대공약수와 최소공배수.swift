func solution(_ n:Int, _ m:Int) -> [Int] {
    
    func calculate(_ n:Int, _ m:Int) -> [Int] {
        var nums: [Int] = []
        for num in 1...n {
            if n % num == 0 {
                nums.insert(num, at: 0)
            }
        }
                
        for num in nums {
            if m % num == 0 {
                return [ num, (n * m) / num]
            }
        }
        
        return [ n, n ]
    }
    
    return n < m ? calculate(n, m) : calculate(m, n)
}