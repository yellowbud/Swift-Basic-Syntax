import UIKit

//----------动态成员查找与动态方法调用----------------//

/*
 
 动态成员查找这个特性使得使用swift语言在访问类、结构体或枚举等属性时，更具动态化。
 class CustomData {
     var name:String = ""
     var age:Int = 0
 }
 
 let obj = CustomData()
 print(obj.name)
 
 
 //报错，CustomData类中没有other属性
 let str:String = obj.other
 print(str)
 
 上面的示例代码中，CustomData类中并没有定义other属性，直接对其进行访问会产生编译错误，我们可以使用@dynamicMemberLookup来对CustomData类进行修饰
 @dynamicMemberLookup 可以为数据结构增加动态成员查找的能力
 修改上面的代码如下：
 
 @dynamicMemberLookup
 class CustomData {
     var name:String = ""
     var age:Int = 0
     subscript(dynamicMember member: String) -> String {
         return "unknown"
     }
     subscript(dynamicMember member: String) -> Int {
         return 0
     }
 }

 let obj = CustomData()
 print(obj.name)
 
 let str: String = obj.other
 let num:Int = obj.num

 print (str, num) //将输出unknow o
 
 如以上代码所示，增加了动态成员查找功能后，如果我们访问了不存在的属性，就会根据指定的属性类型调用对应的subscript方法来返回对应类型的值。
 
 动态方法调用与动态成员查找类似，对于一般的数据类型，我们也不可以直接将其实例作为方法进行调用，除非其支持动态方法调用。
 
 使用@dynamicCallable可以将类型修饰为支持动态方法调用，示例代码如下：
 */







@dynamicMemberLookup
@dynamicCallable
class CustomData {
    var name:String = ""
    var age:Int = 0
    subscript(dynamicMember member: String) -> String {
        return "unknow"
    }
    subscript(dynamicMember member: String) -> Int {
        return 0
    }
    func dynamicallyCall(withArguments arg:[String]) {
        print("unknow func:\(arg)")
    }
    func dynamicallyCall(withKeywordArguments pairs: KeyValuePairs<String, Int>) {
        let res = pairs.map {key, value in
                    return "[\(key):\(value)]"
                }.joined(separator: "")
        print(res)
    }
}

let obj = CustomData()
obj("字符串参数","a","b") // unknow func:["字符串参数", "a", "b"]
obj(a:1, b:2) //[a:1][b:2]
print(obj.name)
let str:String = obj.other
let num:Int = obj.num
print(str, num)


/*
 要支持动态方法调用，我们需要实现dynamicallyCall(withArguments：) 方 法 与dynamicallyCall(withKeywordArguments:)方法，这两个方法的区别在于调用的时候是直接传入一组参数还是以键值对的方式传入参数。
 
 动态成员查找和动态方法调用都使得swift语言有了更加强大的动态性，我们可以通过动态成员查找在运行时获得要调用的方法和参数，再使用动态方法调用使其执行
 
 
 */

//----------------------泛型与协议功能的增强-------------------------------//

/*
 
 subscript方法可以为Swift中的类添加下标访问的支持，不止可以支持泛型，而且可以支持where子句进行协议中关联类型的约束，示例如下
 */

//下标协议
protocol Sub {
    associatedtype T
    func getIndex() -> T
}
//实现下标协议的一种下标类
class Index:Sub {
    init(_ index:Int) {
        self.index = index
    }
    var index:Int
    func getIndex() -> Int {
        return self.index
    }
}

class MyArray {
    var array = Array<Int>()
    func push(item:Int) {
        self.array.append(item)
    }
    //泛型并进行约束
    subscript<T: Sub>(i:T)->Int where T.T == Int {
        return self.array[i.getIndex()]
    }
}
var a = MyArray()
a.push(item: 1)
print(a[Index(0)])

//Swift在对变量类型进行界定时，是支持使用协议的

protocol People {
    var name:String{set get}
    var age:Int{set get}
}

protocol Teach {
    func teachSwift()
}

class Teacher: People,Teach {
    var name: String = "hhhhhh"
    
    var age: Int = 26
    
    func teachSwift() {
        print("teaching........")
    }
}


func printTeacher(p:Teach&People) {
    print(p.name,p.age)
    p.teachSwift()
}


//使用 “＆” 符号可以对协议进行混合，更加贴近面向协议的编程方式。

/*
 
 swift 语言的独到之处。
 
 安全性极高。所谓安全性，实际上就是语言是否容易出错，即一种编程语言是依赖自身特性防止出错还是依赖依赖开发者经验防止其出错。
javascript是变量弱类型，并且其隐式转换十分危险，在swift中基本不会出现类型不匹配、类型被隐式转换了等问题。这也必须遵守更多规则（更多代码）
 
 灵活性极高。灵活性非常有现代编程语言的特点，尤其是其对泛型的支持，使得面向协议的编程方式
 
编码体验好。不完全依赖于swift的语言，也有编译器的功劳。例如支持字符串内嵌变量来构建字符串，支持后置闭包的写法，支持元组类型，支持默认隐式拆包类型
 
 
 */
