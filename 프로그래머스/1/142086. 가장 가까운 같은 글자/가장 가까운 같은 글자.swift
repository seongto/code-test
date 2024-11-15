import Foundation

func solution(_ s:String) -> [Int] {
    var answer: [Int] = []   
    var strDic: [String : Int] = [:] // 마지막 인덱스 저장
    var strs: [String] = s.map { String($0) }
    
    for (idx, str) in strs.enumerated() {
        if idx == 0 {
            answer.append( -1 )
        } else {
            if let i = strDic[str] {
                answer.append(idx - i)
            } else {
                answer.append(-1)
            }
        }
        // 해당 글자의 마지막 인덱스를 저장.
        strDic[str] = idx
    }
    
    return answer
}
