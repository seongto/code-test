import Foundation

func solution(_ s:String) -> [Int] {
    var answer: [Int] = []
    var strDic: [String : Int] = [:]
    
    var strs: [String] = s.map { 
        strDic[String($0), default: 0] += 1
        return String($0) 
    }
    
    for (idx, str) in strs.enumerated() {
        if ( idx == 0) || ( strDic[str] == 1 ) {
            answer.append( -1 )
        } else {
            if let i = Array(strs[0...idx - 1]).lastIndex(of: str) {
                answer.append(idx - i)
            } else {
                answer.append(-1)
            }
        }
    }
    
    
    
//     for ( i1, v1 ) in strs.enumerated() {
//         if i1 == 0 {
//             answer.append(-1)
//             continue
//         }
        
//         var slicedArray = Array(strs[0...i1-1]).reversed()
        
//         if slicedArray.contains(v1) {
//             for ( i2, v2) in slicedArray.enumerated() {
//                 if v1 == v2 {
//                     answer.append(i2 + 1)
//                     break
//                 }
//             }
//         } else {
//             answer.append(-1)
//         }  
//     }
    
    return answer
}