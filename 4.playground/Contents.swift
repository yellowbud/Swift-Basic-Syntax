import UIKit
import Foundation

//----------------在Swift中创建数组的N种方式-----------------------//

//字面量创建空数组，创建空数组时必须有类型信息
var arra:[Int] = []

//初始化器有两种方式
var ma = [String]()
var me = Array<String>()

let fiveZs = Array(repeating: "Z", count: 5) //["Z", "Z", "Z", "Z", "Z"]

let nu = [Int](0...7) //[0, 1, 2, 3, 4, 5, 6, 7]

let persons = ["fd": 21, "f": 27, "df": 29]
let names = [String](persons.keys) //["df", "f", "fd"]
print(names)


let char = Array("hello")
print(char) //["h", "e", "l", "l", "o"]

let num1 = Array(1...9) // [1, 2, 3, 4, 5, 6, 7, 8, 9]


//-------------------------遍历和索引----------------------------------//

/*
 forEach方法
 
 无法使用break或continue跳出/跳过循环
 使用return只能退当前一次循环的执行体

 */

let numbers = [Int](2...7) // let numbers = Array(2...7)

numbers.forEach { (num) in
    print(num)
}


//遍历，同时得到 索引和值
for (index, num) in numbers.enumerated(){
    print("the index is :\(index)")
    print(num * 10)
}

for i in 0..<numbers.count {
    print("the index is :\(i)")
    print(numbers[i])
}

//用Iterator遍历数组
var numIterator = numbers.makeIterator() //得到迭代器
while let num = numIterator.next() { //迭代器有下一个都会继续循环 .numIterator.next为nil，停止循环
    print(num * 10)
}

/*
 startIndex返回第一个元素的位置，对于数组来说，永远是0
 
 endIndex返回最后一个元素索引 + 1 的位置，对于数组来说，等同 count
 
 如果数组为空，startIndex 等于 endIndex
 
 */

//indices 获取数组的索引区间

for i in numbers.indices {
    print("the index is \(i)")
    print(numbers[i])
}

//------------------------访问和操作数组：查找操作----------------------------//

let arr = [10, 20, 45, 30, 98, 101, 30, 4]
print(arr.contains(where: {$0 > 10})) // true 是否有值大于10
print(arr.allSatisfy({$0 > 3 })) //true

//-------访问和操作数组：添加和删除---------//

var numbers1 = [Int](2...7)
numbers1.append(contentsOf: 100...105) //添加多个元素
print(numbers1)

//字符串也是Collection，Element是Character类型

var chars:[Character] = ["a","b","c","d","e","f"]
chars.insert(contentsOf: "hello", at: 0)
print(chars) //["h", "e", "l", "l", "o", "a", "b", "c"]
chars.remove(at: 1) //移除并返回移除的元素
chars.removeFirst() // 移除并返回数组的第一个元素
 //popFirst()移除并返回数组的第一个元素（optional），数组为空返回nil

chars.removeFirst(2)//移除数组前面多个元素
chars.removeLast(2) //移除数组后面多个元素

chars.removeSubrange(1...2) //移除数组中给定范围的元素
chars.removeAll(keepingCapacity: true) //移除数组所有元素，保留数组容量
print(chars) //[]
print(chars.capacity) // 12

//-------------------ArraySlice-----------------------------//
/*
 ArraySlice是数组或者其他ArraySlice的一段连续切片，和原数组共享内存
 
 当要改变ArraySlice的时候，ArraySlice会copy出来，形成单独内存
 
 ArraySlice 拥有和Array基本完全类似的方法
 
 通过drop得到ArraySlice
 */
let array2 = [1,2,3,4,5,6]
array2.dropFirst() // [2, 3, 4, 5, 6]
print(array2) //  [1, 2, 3, 4, 5, 6]
array2.dropFirst(3) //[4, 5, 6] 移除3个元素
print(array2) //[1, 2, 3, 4, 5, 6]
array2.dropLast()
array2.dropLast(3)
print(array2.drop { $0 < 15 }) //[] 移除小于15的元素

//通过 prefix 得到ArraySlice
var array3 = [5,2,10,1,0,100,46,99]
array3.prefix(4) // 获取指定个数的元素组成的ArraySlice
array3.prefix(upTo: 4) // [5, 2, 10, 1]
array3.prefix(through: 4) // [5, 2, 10, 1, 0]
print(array3)
print(array3.prefix{ $0 < 10 }) // [5,2] 遇到第一个不符合条件的就停止

//通过 suffix 得到ArraySlice
array3.suffix(3) // [100, 46, 99]
array3.suffix(from: 5) //[100, 46, 99] 从指定位置（包含）到结尾的元素

//通过Range得到ArraySlice
array3[2...4]
array3[3..<5]
array3[...2]
array3[..<2]
array3[6...]
array3[...] //[5, 2, 10, 1, 0, 100, 46, 99]

//-----------------ArraySlice转为Array---------------------------//
//ArraySlice无法直接赋值给一个Array的常量/变量，需要使用 Array（slice）
let slice3 = array3[3...5]
array3 = Array(slice3) // ArraySlice类型转为 Array




//-------------------ArraySlice和原Array相互独立----------------------------------//
//它们添加删除元素不会影响对方

var array4 = [10, 46, 99] //[10, 46, 99]
var slice4 = array4.dropLast() // ArraySlice [10, 46]
array4.append(333) //[10, 46, 99, 333]
print(slice4) // [10, 46]
slice4.append(555) //[10, 46, 555]
print(array4) //[10, 46, 99, 333]


//-------------------------访问和操作数组：重排操作 ------------------------------------//

//数组元素的随机化

//shuffle（）在原数组上将数组元素打乱，只能作用在数组变量上，改变原数组


var array5 = [Int](1...4)
array5.shuffle()
print(array5) //[1, 4, 2, 3]

//shuffled（）返回原数组的随机化数组，可以作用在数组变量和常量上,不改变原数组
let array6 = [Int](1...4)
array6.shuffled() // [1, 4, 3, 2]
print(array6) //[1, 2, 3, 4]


//数组的逆序

//reverse（）在原数组上将数组逆序，只能作用在数组变量上，改变原数组
var array7 = [Int](1...4)
array7.reverse()
print(array7) // [4, 3, 2, 1]


//reversed（）返回原数组的逆序“集合表示”，可以作用在数组变量和常量上，该方法不会分配新内存空间
let array8 = [Int](1...4)
array8.reversed() //ReversedCollection<Array<Int>>(_base: [1, 2, 3, 4]).与array8共享内存，迭代器为逆序
for i in array8.reversed() {
    print(i)
}


//partition以某个条件分组，前半部分不符合条件的元素，后半部分符合
var array9 = [10, 20, 45, 30, 98, 101, 30, 4]
let index = array9.partition { (element) -> Bool in element > 30 } // 等同 let index = array9.partition(by: { $0 > 30 })
print(index) //5
print(array9) //[10, 20, 4, 30, 30, 101, 98, 45]

let partition91 = array9[..<index] //[10, 20, 4, 30, 30]
let partition92 = array9[index...] //[101, 98, 45]


//数组的排序
//sort（）在原数组上将元素排序，只能作用于数组变量。改变原数组

//sorted（）返回原数组的排序结果数组，可以作用在数组变量/常量上，不改变原数组
let array10 = [9,6,3,4,5,6]
let array11 = array10.sorted()

//swapAt（_:_:）交换指定位置的两个元素，修改原数组
array9.swapAt(array9.startIndex, array9.endIndex - 1)

//字符串数组拼接

var st = ["hello", "world"]
st.joined() //"helloworld"
st.joined(separator: ".") //"hello.world"

//------------------数组的拼接------------------------//
//元素为Sequence数组的拼接
//joined()拼接数组里的所有元素为一个更大的Sequence


let ranges = [0..<3, 8..<10, 15..<17]
for range in ranges {
    print(range)
}
for i in ranges.joined(){
    print(i)
}

//joined(separator:)以给定的分隔符拼接数组里的所有元素为一个更大的Sequence
let nestedNumbers = [[1,2,3],[4,5,6],[7,8,9]]
let joined = nestedNumbers.joined(separator: [-1,-2]) //JoinedSequence<Array<Array<Int>>>
Array(joined) // [1, 2, 3, -1, -2, 4, 5, 6, -1, -2, 7, 8, 9]

//-------------------深入理解数组：底层实现探究---------------------------//
// 一个序列Sequence代表的是一系列具有相同类型的值，可以对这些值进行迭代

// LteratorProtocol
// Sequence 通过创建一个迭代器来提供对元素的访问。迭代器每次产生一个序列的值，并且当遍历序列时对遍历状态进行管理
//当序列被耗尽时，next()应该返回nil

protocol IteratorProtocol {
    associatedtype Element
    mutating func next() -> Element?
}


/*Collection
一个Collection是满足下面条件的Sequence
 
 稳定的Sequence，能够被多次遍历且保持一致
 
 除了线性遍历外，集合中的元素也可以通过下标索引的方式被获取到
 
 和Sequence不同，Collection类型不能是无限的

*/

//--------------如何用数组来实现栈和队列---------------------//

struct Stack<T> {
    private var elements = [T]() //T类型的数组
    
    var count: Int {
        return elements.count
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var peek: T? {
        return elements.last
    }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.popLast()
    }
}


var stack = Stack<Int>()
stack.push(1)
stack.push(3)
stack.push(8)
print(stack.pop() ?? 0) //pop得到的是可选值类型，移除并返回最后一个值
print(stack.count)



//Queue

struct Queue<T> { //泛型的结构体

    private var elements:[T] = []

    var count: Int {
        return elements.count
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var peek: T? {
        return elements.first
    }
    
    mutating func enqueue(_ element:T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil :elements.removeFirst()
    }
}



var queue = Queue<Int>()
queue.enqueue(1)
queue.enqueue(3)
queue.enqueue(8)
print(queue.dequeue() ?? 0)
print(queue.count)



//









let ar = [[1,24],[3,7,8],[0.9,3]]
print(ar.flatMap({$0}))



let numbers5 = [1, 2, 3, 4]

let mapped = numbers5.map { Array(repeating: $0, count: $0) }
// [[1], [2, 2], [3, 3, 3], [4, 4, 4, 4]]

let flatMapped = numbers5.flatMap { Array(repeating: $0, count: $0) }
// [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]
