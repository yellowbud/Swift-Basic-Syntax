import UIKit
import Foundation

3 % 4 //3

// 8 % 2.5 报错
8.truncatingRemainder(dividingBy: 2.5) //取余 0.5


7.5/2.5 //3


//--------------------为类和结构体自定义运算符实现----------//
struct Vector2D {
    var x = 0.0, y = 0.0
}

//重载
extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y )
    }
}


let vector = Vector2D(x: 1.0, y: 2.0)
let anotherVector = Vector2D(x: 3.0, y: 1.0)
let thirdVector = vector + anotherVector
print(thirdVector.x)
print(thirdVector.y)


//一元运算符，需要指定前缀后缀
extension Vector2D {
    static prefix func - (vector:Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}
let vector2 = -vector
print(vector2.x)
print(vector2.y)



extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

var vector3 = Vector2D(x: 1.0, y: 1.0)
let vector4 = Vector2D(x: 2.0, y: 3.0)
vector3 += vector4
print(vector3.x) //3
print(vector3.y) //4


//不用重载 == ，则用struct Vector2D：Equatable，效果相同

extension Vector2D: Equatable {
    static func == (left: Vector2D,right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}
print(vector4 == vector3)

// 当重载了 == 运算符，可用 ！= 判断
print(vector4 != vector3)

//------------------在Swift中定义自己的运算符-------//

//新的运算符要在全局作用域内，使用 operator 关键字进行声明，同时还要指定prefix、infix 或者postfix 限定符

prefix operator +++

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
print(afterDoubling)

//-----------------自定义中缀运算符的优先级和结合性---------------------------//
/*
 自定义的中缀（infix）运算符也可以指定优先级和结合性
 每一个自定义的中缀运算符都属于一个优先级组
 优先级组指定了自定义中缀运算符和其他中缀运算符的关系
 */

precedencegroup MyPrecedence {
    associativity: left
    lowerThan: AdditionPrecedence
}


infix operator +-: AdditionPrecedence //优先级组
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}
let firsrVector = Vector2D(x: 1.0, y: 3.0)
let secondVector = Vector2D(x: 2.0, y: 7.0)
let result = firsrVector +- secondVector
print(result)


//----------循环控制-------------//

//在for-in循环体中使用显式命名常量分解元组成员

//dictionary
let ban = ["spider": 8, "ant": 6, "cat": 4]

for (a,b) in ban {
    print(a,b)
}

for t in ban { //t是元组，通过访问元组的方式来访问值
    print(t.0) //key
    print(t.1) // value
}


//如果不需要序列的每一个值，可使用下划线来取代遍历名忽略值
let base = 3
let power = 5
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)") // 3的5次方


/*
 for-in 分段区间
 
 stride(from:to:by）（开区间）
 
 闭区间 stride(from:through:by）
 
 */

for i in stride(from: 0, to: 20, by: 5){
    print(i)
}

//--------switch------------//

/*
 
 switch 语句会将一个值与多个可能的模式匹配。然后基于第一个成功匹配的模式来执行合适的代码块。
 
 
 */

let c2 = "a"
switch c2 {
case "a","i","u":
    print("元音字母")
default:
    print("其他字符")
}


//你可以使用元组来在一个switch 语句中测试多个值

let point = (1,0) //元组匹配
switch point {
case (let x, 0):
    print("x is \(x) when y is 0")
case(0,let y):
    print("y is \(y) when x is 0")
default:
    print("other")
}

// 元组匹配。使用 _ 来表明匹配所有可能的值

let somePoint = (1,1)
switch somePoint {
case(0,0):
    print("(0,0)is at the origin")
case(_,0):
    print("(\(somePoint.0),0) is on the x-axis")
case (0,_):
    print("(0, \(somePoint.1)) is on the y-axis")
case(-2...2,-2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0),\(somePoint.1)) is outside of the box")
}

//值绑定
//switch 的case 可以将匹配到的值临时绑定为一个常量或者变量，来给 case 的函数体使用。
//如果使用 var 关键字，临时的变量就会以合适的值来创建并初始化。对这个变量的任何改变都只会在 case 的函数体内有效。
let anotherPoint = (2,0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x,y):
    print("somewhere else at (\(x), \(y))")
}

//switch case 可以使用 where 分句来检查是否符合特定的约束

let yetAnotherPoint = (1,-1)
switch yetAnotherPoint {
case let (x,y) where x == y :
    print("(\(x), \(y)) is on the line x == y")
case let (x,y) where x == -y :
    print("(\(x), \(y)) is on the line x == -y")
case let (x,y):
    print("(\(x), \(y)) is just some arbitrary point")
}

/*
 
 复合匹配
 
 如果任何一个模式匹配了，那么这个情况都会被认为是匹配的
 
 */

let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l",
    "n","z":
    print ("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

/*
 复合匹配 值绑定
 
 复合匹配同样可以包含值绑定。所有复合匹配的模式都必须包含相同的值绑定集合，并且复
 合情况中的每一个绑定都得有相同的类型格式。这才能确保无论复合匹配的哪部分命中了，
 接下来的函数体中的代码都能访问到绑定的值并且值的类型也都相同。
 */

let stillAnotherPoint = (9,0)
switch stillAnotherPoint {
case (let distance, 0), (0,let distance):
    print("On an axis, \(distance) from the origin")
default:
    print ("Not on an axis")
}




//-------控制转移-----------//

//continue 语句告诉循环停止正在做的事情并且再次从头开始循环的下一次遍历。它是说 我不再继续当前的循环遍历了,而不是离开整个的循环。

/*
 break 语句会立即结束整个控制流语句。
 
 当在循环语句中使用时，break 会立即结束循环的执行，并且转移控制到循环结束花括号
 （}）后的第一行代码上。当前遍历循环里的其他代码都不会被执行，并且余下的遍历循环
 也不会开始了。
 
 当在switch 语句里使用时，break 导致switch 语句立即结束它的执行，并且转移控制到
 switch 语句结束花括号（}）之后的第一行代码上。
 
*/

/*
 用语句标签来给循环语句或者条件语句做标记。在一个条件语句中，你可以使用一个语
 句标签配合 break 语句来结束被标记的语句。在循环语句中，你可以使用语句标签来配合
 break 或者 continue 语句来结束或者继续执行被标记的语句。

 */

var number = 10
whileLoop : while number > 0 {
    switch number {
    case 9 :
        print("9")
    case 10:
        var sum = 0
        for index in 0...10 {
            sum += index
            if index == 9 {
                print(sum)
                break whileLoop
            }
        }
    default:
        break
    }
    number -= 1
}


func isIPAddress(ipAddr: String) -> (Int, String) {
    let compoments = ipAddr.split(separator: ".")
    if compoments.count == 4 {
        if let first = Int(compoments[0]), first >= 0 && first < 256 {
            if let second = Int (compoments[1]), second >= 0 && second < 256 {
                if let third = Int (compoments[2]), third >= 0 && third < 256 {
                    if let fourth = Int (compoments[3]), fourth >= 0 && fourth < 256 {
                        return (0, "")
                    } else {
                        return (4, "第四个数不对")
                    }
                } else {
                    return (3, "第三个数不对")
                }
            } else {
                return (2, "第二个数不对")
            }
        } else {
            return (1, "第一个数不对")
        }
    }
    return (100,"ip 只能有4部分")
}


func isIPAddress2(ipAddr: String) -> (Int, String) {
    let compoments = ipAddr.split(separator: ".")
    
    guard compoments.count == 4 else {
        return (100, "ip 只能有4部分")
    }
    
    guard let first = Int(compoments[0]), first >= 0 && first < 256 else {
        return (1, "第一个数不对")
    }
    
    guard let second = Int(compoments[1]), second >= 0 && second < 256 else {
        return (2, "第二个数不对")
    }
    
    guard let third = Int(compoments[2]), third >= 0 && third < 256 else {
        return (3, "第三个数不对")
    }
    
    guard let fourth = Int(compoments[3]), fourth >= 0 && fourth < 256 else {
        return (4, "第四个数不对")
    }
    return (0, "")
}


/*
 
 检查 API 的可用性
 
 Swift 拥有内置的对 API 可用性的检查功能，它能够确保你不会悲剧地使用了对部属目标不可用的 APl。
 
 你可以在 if 或者guard 语句中使用一个可用性条件来有条件地执行代码，基于在运行时你想用的哪个 API 是可用的
 
 */

//---------Swift中的模式和模式匹配----------//

/*
 
 模式代表单个值或者复合值的结构。
 
 因为模式代表一种值的结构，而不是特定的某个值，你可以利用模式来匹配各种各样的值。
 
 你可以从复合值中提取出部分或全部值，然后分别把各个部分的值和一个常量或变量绑定起来。
 
 Swift 中的模式分为两类：
 一种能成功匹配任何类型的值，另一种在运行时匹配某个特定值时可能会失败。
 
 通配符模式 (Wildcard Pattern)
 标识符模式 (ldentifier Pattern)
 值绑定模式 (Value-Binding Pattern)
 元组模式 (Tuple Pattern)
 枚举用例模式 (Enumeration Case Pattern)
 可选项模式 (Optional Pattern)
 类型转换模式 (Type-Casting Pattern)
 表达式模式 (Expression Pattern)
 */

//通配符模式由一个下划线 _ 构成，用于匹配并忽路任何值。当你想忽略被匹配的值时可以使用该模式。
for _ in 1...3 {
    //...
}

//标识符模式匹配任何值，并将匹配的值和一个变量或常量绑定起来。
let someVlue = 42


//值绑定模式 (Value-Binding Pattern) 把匹配到的值绑定给一个变量或常量。把匹配到的值绑定给常量时，用关键字let，绑定给变量时，用关键字var。
let point1 = (3,2)
switch point1 {
    //将point 中的元素绑定到 x 和y
case let (x,y):
    print ("The point1 is at (\(x), \(y)). ")
}

/*
 
 元组模式 (Tuple Pattern)
 
元组模式是由逗号分隔的，具有零个或多个模式的列表，并由一对圆括号括起来。元组模式匹配相应元组类型的值。

 */
let points = [(0,0),(1,0),(1,1),(2,0),(2,1)]
for (x,y) in points where y == 0 {
    print("\(x) and \(y)")
}

/*
 
 可选项目模式 (Optional Pattern)
 
 可选项模式匹配 Optional<Wrapped>枚举在some(Wrapped）中包装的值。
 
 可选项目模式为 for-in 语句提供了一种迭代数组的简便方式，只为数组中非nil 的元素执行循环体
 
 */

let arrayOfOptionalInts:[Int?] = [nil, 2, 3, nil, 5]
//Match only non-nil values.
for case let number? in arrayOfOptionalInts {
    print ("Found a \(number)")
}


/*
 
 类型转换模式 (Type-Casting Pattern)
 
 有两种类型转换模式，is 模式和as 模式。is 模式只出现在switch 语句中的case 标签中
 
 is类型
 模式as类型
 
 is 模式仅当一个值的类型在运行时和 is 模式右边的指定类型一致，或者是其子类的情况下，
 才会匹配这个值。is 模式和 is 运算符有相似表现，它们都进行类型转换，但是 is 模式没有返回类型
 
 as模式仅当一个值的类型在运行时和as 模式右边的指定类型一致，或者是其子类的情况
 下，才会匹配这个值。如果匹配成功，被匹配的值的类型被转换成 as 模式右边指定的类型。
 
 */
protocol Animal {
    var name:String { get }
}

struct Dog: Animal {
    var name: String {
        return "dog"
    }
    var runSpeed:Int
}

struct Bird: Animal {
    var name: String{
    return "bird"
    }
    var flightHeight: Int
}

struct Fish: Animal {
    var name: String {
        return "fish"
    }
    var depth: Int
}
 
let animals:[Any] = [Dog(runSpeed: 55), Bird(flightHeight: 2000), Fish(depth: 100)]

for animal in animals {
    switch animal {
    case let dog as Dog:
        print("\(dog.name) can run \(dog.runSpeed)")
    case let fish as Fish:
        print("\(fish.name) can dive depth \(fish.depth)")
    case is Bird:
        print("bird can fly!")
    default:
        print("unknown animal!")
    }
}


/*
 
 表达式模式 (Expression Pattern)。表达式模式代表表达式的值。表达式模式只出现在 switch 语句中的 case 标签中.

 表达式模式代表的表达式会使用 Swift 标准库中的~=运算符与输入表达式的值进行比较
 如果 ~二运算符返回 true，则匹配成功。默认情况下，~二运算符使用 =二运算符来比较两个
 相同类型的值。它也可以将一个整型数值与一个 Range 实例中的一段整数区间做匹配。

*/

//可以重载 ~=运算符来提供自定义的表达式匹配行为

//自定义类型默认也是无法进行表达式模式匹配的，也需要重载 ~=运算符。

struct Employee {
    var salary:Int
}

func ~= (left:ClosedRange<Int>, right:Employee) -> Bool {
    return left.contains(right.salary)
}

var e: Employee = Employee(salary: 6000)

switch e {
case 0...1000:
    print("hungry")
case 1000...5000:
    print("勉强")
case 5000...10000:
    print("还不错")
default:
    print("高薪")
}


