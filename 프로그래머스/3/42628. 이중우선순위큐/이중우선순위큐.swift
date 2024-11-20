import Foundation

// 각각의 힙을 정의하는 구조체.
// 초기화시 sort 클로저에 할당하는 연산기호(연산기호는 그 자체가 클로저)에 따라 maxHeap(>), minHeap(<)이 된다.
// 타입으로부터 자유롭게 비교 가능한 heap을 구현하기 위해 제너릭 사용.
struct Heap<T: Comparable> {
    var heap: [T] = [] // 힙을 저장하는 배열
    private let sort: (T, T) -> Bool
    
    init( sort: @escaping (T, T) -> Bool) {
        // 아래 코드는 다음으로 축약 가능 : self.sort = sort
        self.sort = { (a: T, b: T) -> Bool in
            return sort(a, b)
        }
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    // 루트 노드의 값을 반환
    var peek: T? {
        return heap.first
    }
    
    // 항상 가장 마지막 리프 노드에 값을 추가한 후 정렬작업을 거친다.
    mutating func insert(_ value: T) {
        heap.append(value)
        siftUp(from: heap.count - 1)
    }
    
    // 이 함수는 항상 루트 노드인 peek의 값을 삭제한다.
    mutating func remove() {
        guard !heap.isEmpty else { return } // 배열이 비어있는 경우 대비
        
        if heap.count == 1 {
            heap.removeFirst()
        } else {
            heap.swapAt(0, heap.count - 1)
            heap.removeLast()
            siftDown(from: 0)
        }
    }
    
    private mutating func siftUp(from idx: Int) {
        var child = idx
        var parent = (child - 1) / 2
        while child > 0 && sort(heap[child], heap[parent]) { // 연산기호에 따라 max힙의 경우 parent가 더 작을 경우 swap, min힙에서는 반대로 작동
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    private mutating func siftDown(from idx: Int) {
        var parent = idx
        
        while true {
            let childLeft = parent * 2 + 1
            let childRight = parent * 2 + 2
            var candidate = parent
            
            // 자식이 모두 있지 않은 경우도 있으므로 왼쪽 자식부터 차례대로 비교하기
            // 왼쪽 자식이 있을 경우 부모와 왼쪽 자식 비교 후 연산 기준에 따라 결과 저장.
            if childLeft < heap.count && sort(heap[childLeft], heap[candidate]) {
                candidate = childLeft
            }
            // 오른쪽 자식이 있을 경우 현재 후보자와 오른쪽 자식 비교 후 연산 기준에 따라 결과 저장.
            if childRight < heap.count && sort(heap[childRight], heap[candidate]) {
                candidate = childRight
            }
            
            // 스왑 대상이 부모일 경우 자식보다 부모가 우선한다는 말이므로 변경 중단 후 종료.
            // 이 메소드는 오직 부모가 우선하는 상황에서만 탈출할 수 있다.
            if candidate == parent {
                return
            }
            
            heap.swapAt(parent, candidate)
            parent = candidate // 새로운 반복에서는 다음 노드에서 진행할 수 있도록 기준이 되는 부모를 변경.
        }
    }
}

// maxHeap 과 minHeap 모두를 갖는 이중구조 힙
struct DualHeap<T: Comparable> {
    var maxHeap = Heap<T>(sort: >) // 최대 힙
    var minHeap = Heap<T>(sort: <) // 최소 힙
    
    
    // 현재 힙의 길이를 반환
    var count: Int {
        return maxHeap.heap.count
    }
    
    /// 새로운 값이 추가되면 양 heap 모두에 값을 추가.
    mutating func insert(_ value: T) {
        maxHeap.insert(value)
        minHeap.insert(value)
    }
    
    /// 이중구조 힙 모두에서 최대값을 삭제.
    /// maxHeap에서 값을 삭제하고 해당 값을 minHeap에서 찾아서 삭제.
    mutating func removeMax() {
        // heap에 요소가 없을 경우 중단
        guard !maxHeap.isEmpty else { return }
        
        // maxHeap에서 최대값 삭제
        let max = maxHeap.peek
        maxHeap.remove()
        
        // minHeap에서 최대값을 찾고, 마지막 값과 자리 변경 후 삭제.
        // 무조건 같은 값이 리프 노드에 있으므로 lastIndex로 찾아서 삭제.
        let maxIdx: Int = minHeap.heap.lastIndex(of: max!)!
        minHeap.heap.swapAt(maxIdx, minHeap.heap.endIndex - 1)
        minHeap.heap.removeLast()
        
    }
    
    /// 이중구조 힙 모두에서 최소값을 삭제.
    /// minHeap에서 값을 삭제하고 해당 값을 maxHeap에서 찾아서 삭제.
    mutating func removeMin(){
        // heap에 요소가 없을 경우 중단
        guard !maxHeap.isEmpty else { return }
        
        // minHeap에서 최소값 삭제
        let min = minHeap.peek
        minHeap.remove()
        
        // maxHeap에서 해당 최소값을 찾고, 마지막 값과 자리 변경 후 삭제
        let minIdx: Int = maxHeap.heap.lastIndex(of: min!)!
        maxHeap.heap.swapAt(minIdx, maxHeap.heap.endIndex - 1)
        maxHeap.heap.removeLast()
    }
    
    func getMax() -> T? {
        return maxHeap.peek
    }
    
    func getMin() -> T? {
        return minHeap.peek
    }
}

func solution(_ operations:[String]) -> [Int] {
    var dualHeap = DualHeap<Int>()
    
    for operation in operations {
        var array = operation.split(separator:" ").map { String($0) }
        
        switch array[0] {
            case "I":
                dualHeap.insert(Int(array[1])!)
            case "D":
                if array[1] == "1" {
                    dualHeap.removeMax()
                } else if array[1] == "-1" {
                    dualHeap.removeMin()
                }
            default:
                continue
        }
    }
    
    guard dualHeap.count != 0 else {
        return [ 0, 0 ]
    }
    
    return [dualHeap.getMax()!, dualHeap.getMin()!]
}