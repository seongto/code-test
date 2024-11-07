import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])

for num in 1...b {
    print(String(repeating: "*", count: a))
}