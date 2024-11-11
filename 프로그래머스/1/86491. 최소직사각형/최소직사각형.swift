import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var longer: Int = 0
    var shorter: Int = 0
    
    for arr in sizes {
        if longer <= arr.max()! {
            longer = arr.max()!
        }
        
        if shorter <= arr.min()! {
            shorter = arr.min()!
        }
    }
    
    return longer * shorter
}