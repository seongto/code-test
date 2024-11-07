import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])

// for num in 1...b {
//     print(String(repeating: "*", count: a))
// }

// 아래 코드는 분명 맨 아래에 빈줄이 하나 추가되어 사실 오답으로 봐야하지만 통과가 된다..?
print(String(repeating: "\(String(repeating: "*", count: a))\n", count: b))