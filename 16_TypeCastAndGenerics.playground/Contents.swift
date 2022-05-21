//: Playground - noun: a place where people can play

import UIKit

/*
 在Swift语言中，需要使用相应关键字来对实例的类型进行检查与转换，系统会帮助开发者临控此次类型转换是否成功
 
 泛型是swift强大的核心之一。泛型是对普通类型的一种抽象，使用泛型，开发者可以更加方便灵活地表达代码意图。
 
 Swift语言中的扩展语法使得数据类型的构建更加灵活，开发者可以为已经存在的数据类型(如类、结构体、枚举等）添加新的属性和方法。
 
 协议是只有属性与方法的声明，而没有实现的约定集合，
 数据类型可以通过实现协议中约定的属性和方法来遵守这个协议。
 
 扩展和协议结合使用可以为协议中约定的属性或方法添加默认的实现。在ios开发中，协议被广泛应用于事件回调中。
 
 
 
 */
//---------------------类型检查与转换----------------------------//

/*
 数据类型的检查和转换需要使用is和as关键字。
 
 要判断某个实例是否属于某个具体类型，可以使用is关键字，使用is关键字组成的判断语句将返回一个布尔值，开发者可以根据布尔值的真或者假来判断类型检查结果是否匹配。示例代码如下：
 
 */

var str = "HS"
//进行实例的类型检查
if str is String {
    print("str 的类型是String")
}


/*
 
 对于有继承关系的类，类型检查有如下原则：
 
 子类实例进行父类类型的检查可以检查成功。
 
 父类实例进行子类类型的检查不可以检查成功。
 
 上面两条原则其实就是我们编程中常说的向下转换原则。
  使用代码描述上面两条原则，示例代码如下：
 
 //创建一个基类
 class BaseClass {
     
 }
 //创建一个子类
 class MyClass:BaseClass {
 
 }
 
 var cls1 = BaseClass ()
 var cls2 = MyClass ()
 //使用父类实例来进行子类类型的检查，会返回 false
 if clsl is MyClass{
    print ("cls1 的类型是 MyClass ")
 }
 //使用子类实例来进行父类类型的检查，会返回true
 if cls2 is BaseClass(
    print ("cls2 的类型是 Baseclass")
 }
 
 
 */

//----------------Swift 语言中的类型转换-------------------------//

/*
类型转换关键字 as
 与类型检查相似，类型的转换有着向上兼容与向下转换的原则：
 
 一个父类类型的集合可以接收子类类型的实例
 在使用第1条原则中父类集合中的实例时，可以將其转换为子类类型
 
 使用代码描述类型转换的应用，示例代码如下：
 
 //自定义一个类及其子类
 class MyClass: BaseClass {
    var name: String?
 }
 class MySubClassOne: MyClass {
    var count: Int?
 }
 class MySubClassTwo: MyClass{
    var isBiger:Bool?
 }
 
 //创建3个实例
 var objl= MyClass ()
 obj1. name = "HS"
 var obj2 = MySubClassOne()
 obi2. count = 100
 var obi3 = MySubClassIwo()
 obi3.isBiger=true
 
 //将实例存放在其公共父类类型的数组集合中
 var array: [MyClass] = [obj1, obj2, obj3]
 
 //进行遍历
 for var i in 0..<array.count {
    var obj = array[i]
    if obj is MySubClassOne {
        //进行类型转换
    print ( (obj as! MySubClassOne) . count!)
    continue
    }
    if obj is MySubClassTwo {
        //进行类型转换
        print( (obj as! MySubClassIwo).isBiger!)
        continue
    }
 
    if obj is MyClass {
        //使用父类共有的属性
        print (obj .name! )
 }
 }
 
 在使用类型转换时，需要使用as?或者as!方式。as?是一种比较安全的转换方式，其会将类型转换后的结果映射为 Optional 值，如果类型转换成功，则值为原实例，如果类型转换失败，则会返回 Optional 值 nil
 
 而as!是一种强制转换方式，其默认此次转换一定成功，如果转换失败，则会产生运行时错误，程序会崩溃。开发者在使用as!进行类型转换时，必须保证实例的真实类型和要转换的类型一致。
 
 
 
 
 
 //-------------------Any 与 Anyobject 类型---------------------------//
 
 在ios的Cocoa框架中，NSObject类是大部分类的一个基类.
 
 就使用基类作为数组的元素类型来接收不同子类的元素。其实如果数组中的元素是不同类型，并日这些类型没有一个共同的基类，那么开发者可以使用AnyObject来作为引用类型的通用类型。示例代码如下：
 
 //创建 3个各自独立的类
 class MyClassOne{
 
 {
 class MyClassIwo{
 
 {
 class MyClassThree{

 }
 
 //进行类的实例化
 var clsOne = MyClassOne()
 var clsTwo = MyClassTwo ()
 var clsThree = MyClassThree()
 
 // 使用 Anyobject 类型的数组来接收
 var clsArray: Array<AnyObject› = [clsOne, clsTwo, clsThree]
 for obj in clsArray{
    //进行类型的匹配
    if obj is MyClassOne{
        print ("MyClassOne")
    }else if obj is MyClassTwo{
        print ("MyClassIwo")
    }else if obj is MyClassThree{
        print ("MyClassThree")
    }
 }
 
 
 需要注意，AnyObject是通用的引用类型，其并不能用来描述值类型，例如上面的数组不可以存放结构体、枚举等类型的数据。
 swift还提供了一种更加通用的类型Any，它可以用来描述任意类型，包据值类型和引用类型。示例代码如下：
  
 创建 3个各自独立的类
 class MyClassOne{
 
 {
 class MyClassIwo{
 
 {
 class MyClassThree{

 }
 
 //进行类的实例化
 var clsOne = MyClassOne()
 var clsTwo = MyClassTwo ()
 var clsThree = MyClassThree()
 
 //创建一个 Any 元素类型的数组
 var anyArrary：Array<Any> = [clsOne,clsTwo,clsThree,100,"HS",false,(1,1),{()-> in print("Closures")}]
 
 
 
 上面代码中的数组包含自定义类型实例、整型数据、字符串数据、布尔类型值数据、 元组类型数据和闭包类型数据。
 
 */


//创建一个基类
class BaseClass {
    
}
//创建一个子类

//自定义一个类及其子类
class MyClass: BaseClass {
    var name:String?
}
class MySubClassOne: MyClass {
    var count:Int?
}
class MySubClassTwo: MyClass {
    var isBiger:Bool?
}
//创建3个实例
var obj1 = MyClass()
obj1.name = "HS"
var obj2 = MySubClassOne()
obj2.count = 100
var obj3 = MySubClassTwo()
obj3.isBiger=true
//将实例存放在其公共父类类型的数组集合中
var array:[MyClass] = [obj1,obj2,obj3]
//进行遍历
for var i in 0..<array.count {
    var obj = array[i]
    if obj is MySubClassOne {
        //进行类型转换
        print((obj as? MySubClassOne)!.count!)
        continue
    }
    if obj is MySubClassTwo {
        //进行类型转换
        print((obj as! MySubClassTwo).isBiger!)
        continue
    }
    if obj is MyClass {
        //使用父类共有的属性
        print(obj.name!)
    }
}


var cls1 = BaseClass()
var cls2 = MyClass()
//使用父类实例来进行子类类型的检查 会返回false
if cls1 is MyClass{
    print("cls1 的类型是MyClass")
}
//使用子类实例来进行父类类型的检查 会返回true
if cls2 is BaseClass{
    print("cls2 的类型是BaseClass")
}

//创建3个各自独立的类
class MyClassOne {
    
}
class MyClassTwo {
    
}
class MyClassThree {
    
}
//进行类的实例化
var clsOne = MyClassOne()
var clsTwo = MyClassTwo()
var clsThree = MyClassThree()
//创建一个Any元素类型的数组
var anyArray:Array<Any> = [clsOne,clsTwo,clsThree,100,"HS",false,(1,1),{()->() in print("Closures")}]



//使用AnyObject类型的数组来接收
var clsArray:Array<AnyObject> = [clsOne,clsTwo,clsThree]

for obj in clsArray {
    //进行类型的匹配
    if obj is MyClassOne{
        print("MyClassOne")
    }else if obj is MyClassTwo{
        print("MyClassTwo")
    }else if obj is MyClassThree{
        print("MyClassThree")
    }
}

//------------------------泛型---------------------//

/*
 泛型是程序设计语言的一种特性，允许开发者在强类型程序设计语言中编写代码时定义一些
 可变部分，Swif语言的泛型应用不仅十分自由灵活，还可以根据需求添加泛型约束。
 
 泛型通常用来表达一种未定的数据类型，举一个例子，在编写函数时，如果这个函数有参数，开发者需要明确参数的类型。我们要实现一个函数，其功能将对两个inout且类型相同的参数进行值的交换。这个函数的功能需求并没有要求参数具体的类型，只是要求类型相同 对于这类需求，开发者不会也无法使用重载的方式将所有数据类型对应的函数都实现一遍，而泛型刚好可以解决这类问题，示例代码如下：
 
 
 */

//定义泛型
func exchange<T>( param1:inout T, param2:inout T){
    let tmp = param1
    param1 = param2
    param2 = tmp
}
var p1 = "15"
var p2 = "40"
exchange(param1: &p1, param2: &p2)
print(p1,p2)//输出 40 15

/*
 
 如上面的代码所示，泛型可以作为函数的参数。其在语法上的表现为：在函数参数列表前使用尖括号，将要定义的泛型类型列出，其作用域为函数的参数列表与整个函数实现部分，
如果要在一个函数中定义多个泛型，使用逗号进行分隔即可。
 
 泛型除了可以用于定义函数的参数类型外，在定义数据类型时，也起着十分重要的作用。分析Array和Dictionary结构体的实现，可以发现：在声明这类集合数据时，开发者可以同时设置这些集合类型中所要存放的元素的类型，我们也可以通过泛型来实现。
 
 栈是一种先进后出的数据结构，其对数据的操作分为入栈和出栈两种
 
 模仿系统集合类型的实现思路，实现一个自定义结构体类型：栈结构体，示例代码如下：
 
 swift，还有扩展这样一种语法，其作用是为已经存在的数据类型添加新的功能。
 如果对使用了泛型的数据类型进行扩展，在扩展中开发者不需要再次定义泛型，如果需要使用原数据类型定义的泛型，直接使用即可
 
 */



//定义一个栈结构的结构体 ItemType为定义栈中元素类型的泛型
struct Stack<ItemType> {
    //内部有关元素类型的操作 都使用ItemType
    var items:[ItemType] = []
    mutating func push(param:ItemType)  {
        self.items.append(param)
    }
    mutating func pop()->ItemType{
        return self.items.removeLast()
    }
}
//为Stack栈类型添加一个扩展
extension Stack{
    //为其添加一个方法 这个方法将返回整体数据 直接使用泛型ItemType即可
    func getArray() -> [ItemType] {
        return items
    }
}
//整型栈
var obj7 = Stack<Int>()
//进行入栈和出栈操作
obj7.push(param: 1) //入栈
obj7.pop() //出栈
//字符串栈
var obj8 = Stack<String>()
//进行入栈和出栈操作
obj8.push(param: "HS")
obj8.pop()

//---------------对泛型进行约束--------------------//

/*
 之前使用的泛型都是完全泛型，开发者并没有对其进行任何约束，其可以表达任何数据类型。然而有时候，开发需求的是有一定约束条件的泛型。
 Swift语言中可以通过两种方式对泛型进行约束：
 一种是通过继承基类或者遵守协议来进行约束
 另一种是通过where子句来进行约束。
 
 使用继承的方式约束泛型的类型。约束该泛型必须通过某一基类或者继承于某一基类的子类实现，示例代码如下：
 
 //定义一个基类
 class MyClass{
 
 }
 
 //只有MyClass 的类或其子类才可以成为 stack 栈中的元素
 
 struct Stack<ItemType:MyClass> {
    var items:[ItemType] = []
    mutating func push（param:ItemType）{
        self.item.append(param)
    }
    mutating func pop()->ItemType{
        return self.items.removeLast ()
    }
 }
 
 使用遵守协议的方式约定泛型。协议是Swif语言中的一种重要结构
 
 协议中可以定义一些没有实现的方法或者属性，遵守这个协议的类型需要对其中定义的方法和属性进行实现。关于协议的详细内容，后面章节会有所讲解，这里提前使用协议来进行泛型约束的演示，示例代码如下：
 
 protocol MyProtocol {
 
 }
 //定义一个Stack栈结构体，只有遵守了 MyProtocol 协议的类型才可以作为 stack 栈中的元素
 
 struct Stack<ItemType:MyProtocol> {
    //内部有关元素类型的操作都使用 ItemT ype
    var items: [ItemType] = []
    mutating func push (param:ItemType) {
        self.items.append (param)
    }
    mutating func pop () ->ItemType{
        return self.items.removeLast()
    }
 }
 
 其实在协议中，泛型还有特殊的应用：在创建协议时，可以使用associatedtype关键字进行泛型类型的关联，当有数据类型实现此协议时，这个关联的泛型的具体类型才会被指定，示例代码:
 */




//定义一个协议
protocol MyProtocol {
    //实现协议时才指定类型
    associatedtype ItemType
    //协议中约定一个ItemType类型的计算属性param
    var param:ItemType {get set}
    //协议中约定一个打印方法
    func printParam(param:ItemType)->Void;
}
//定义一个遵守MyProtocol协议的类
class MyClassP:MyProtocol {
    //进行param计算属性的实现
    //由于Swift可以自动识别类型 这是MyProtocol中的ItemType为Int
    var param: Int{
        get{
            return 0
        }
        set{
            
        }
    }
    //对打印方法进行实现 此时方法中的参数类型会被识别为Int
    func printParam(param: Int) {
        print(param);
    }
}
//使用where子句与泛型进行结合，可以为泛型添加更加严格的类型约束，示例代码如下，


//T和C都要遵守整型协议
class MyClassTC<T,C> where T:BinaryInteger,C:BinaryInteger {
    var param1:T
    var param2:C
    init(param1:T,param2:C){
        self.param1=param1
        self.param2=param2
        
    }
}


var obj9 = MyClassTC(param1: 1, param2: 1)

