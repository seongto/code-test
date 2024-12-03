import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    var answer: String = ""
    var alphabets: String = "abcdefghijklmnopqrstuvwxyz"
    
    skip.forEach {
        alphabets = alphabets.replacingOccurrences(of: String($0), with: "")
    }
        
    var arr: [Character] = alphabets.map { $0 }
    
    for _ in 1...index / arr.count + 1 {
        arr += arr
    }
            
    s.forEach {
        var idx: Int = arr.firstIndex(of: $0)!
        idx += index
        
        answer += String(arr[idx])
    }
    
    return answer
}