import UIKit

//---------------------扩展与协议---------------------------//

/*
 
 扩展用于对己经存在的数据类型进行新功能的追加，而协议用于约定属性与方法供遵守它的数据类型实现。
 
 //---------使用扩展对已经存在的数据类型进行补充----------//
 
 与Swif语言中的扩展不同的是，类别是有名称的，而扩展没有名称。Swift语言中的扩展支持如下功能：
 
 添加计算属性。
 定义示例方法和类型方法。
 定义新的构造方法。
 定义下标方法
 定义嵌套类型。
 使一个已有的类型遵守协议。
 对协议进行扩展、添加新的属性或方法约定。
 
 
 //创建一个类 有两个属性
 class MyClass {
     var name:String
     var age:Int
     init(){
         name = "HS"
         age = 24
     }
 }
 
 //为MyClass 类扩展一个计算属性
 
 extension MyClass{
    var nameAndAge: String{
        return "\ (name) "+"\ (age) "
    }
 }
 
 var obj = MyClass ()
 //调用扩展中添加的属性
 obj. nameAndAge
 
 
 
 
 上面的代码演示了通过扩展为类新增计算属性。同样，也可以为类型新增一个构造方法，示例代码如下：
 
 extension MyClass {
    var nameAndAge:String {
        return"\(name)"+ "\(age)"
    }
    convenience init(name:String,age:Int){
        self.init()
        self.name = name
        self.age = age
    }
 }
 //使用扩展中的构造方法
 var obj2 = MyClass (name:"ZYH", age: 24)
 
 也可以通过扩展添加实例方法与类方法，示例代码如下：
 
 extension MyClass{
 //扩展一个实例方法
    func logName () -› String {
        print (name)
        return name
    }
 //扩展一个类方法
    class func logClassName (){
        print ("MyClass")
    }
 }
 
 var obj3 = MyClass ()
 //调用扩展中的方法
 obj3.logName ()
 MyClass.logClassName()
 
 
 
 */

//创建一个类 有两个属性
class MyClass {
    var name:String
    var age:Int
    init(){
        name = "HS"
        age = 24
    }
}


extension MyClass{
    //扩展一个实例方法
    func logName() -> String {
        print(name)
        return name
    }
    //扩展一个类方法
    class func logClassName(){
        print("MyClass")
    }
}

var obj3 = MyClass()
//调用扩展中的方法
obj3.logName()
MyClass.logClassName()
//var obj2 = MyClass(name: "ZYH", age: 24)
//var obj = MyClass()
////调用扩展中添加的属性
//obj.nameAndAge


//有一点需要注意，如果是对值类型进行扩展，可以使用mutating关键字来修饰方法，使得在方法内部可以直接修改当前实例本身，示例代码如下

extension Int{
    //修改本身需要使用nutating
    mutating func change() {
        self = self*self
    }
}
var count = 3
count.change()
//打印9
print(count)

//可以使用扩展来使某个类遵守一个协议，示例代码如下：


protocol MyProtocol {
    func myFunc();
}
//使用扩展使类型遵守某个协议
extension MyClass:MyProtocol{
    //必须对协议中的方法进行实现
    func myFunc() {
        print("myFunc")
    }
}
var cls = MyClass()
cls.myFunc()
//需要注意，如果使用扩展使某个数据类型遵守了一个协议，在此扩展中就需要实现协议中的方法。


//-------------------------------------协议的特点与应用-------------------------------------------------//

/*
 
 在语法上，协议中可以定义一些属性和方法，这些属性和方法只是声明，协议中并不能实现这些属性和方法。
 协议不是一种数据类型，没有构造方法，也不需要实例化。
 
 协议的指定只是约定了一系列的属性或者方法，遵守协议的数据类型来为其提供真正的实现
 
 Swift语言中的协议使用protocol 关键字来创建，其中可以声明属性与方法。其中属性在具体实
 现时可以是计算属性，也可以是存储属性。示例代码如下：
 
*/

protocol PortocolNew {
    //定义实例属性
    //可读的
    var name:String{get}
    //可读可写的
    var age:Int{set get}
    //可读的
    var nameAndAge:String{get}
    //定义类属性 静态属性
    static var className:String{get}
}

//创建一个类来遵守Protocol协议
class ClassNew: PortocolNew {
    //进行协议中属性的实现
    var name: String
    var age: Int
    var nameAndAge: String{
        get{
            return "\(name)"+"\(age)"
        }
    }
    static var className: String{
        get{
            return "MyClass"
        }
    }
    init(){
        name = "HS"
        age = 24
    }
}
/*
 
 需要注意，当协议中约定的属性是可读时，并非只读的意思，它在实现中可以是只读的，也可以是可读可写的。如果协议中约定的属性为可读可写，则在实现时其必须是可读可写的。
 在协议中进行方法的定义，示例代码如下：
 
 在协议中声明实例方法与静态方法。同样，协议中可以进行构造方法的声明。
 
 协议中虽然没有任何属性和方法的实现，但在很多应用场景中，其在语法上和普通数据类型有着相似的结构，例如其可以作为函数中参数的类型，其意义是 此参数可以是任意遵守了此协议的数据类型
 
 protocol MyPortocol {
     //定义实例属性
     var name: String{get}
     var age: Int(set get}
     var nameAndAge : String{get}
     static var className: String(get}
     func logName ()
     static func logClassName()
 }
 
 //将协议类型作为参数
func test(param:MyProtocol) {
param.logName（）
}
 
 协议也可以作为某一个集合的元素类型，其意义是集合中所有的元素都要遵守此协议，示例如下：
 
 var array:Array<MyProtoco1>
 
 协议和类拥有相同的继承语法，一个协议继承了另一个协议，它就会拥有父协议中声明的属性和方法，示例代码如下：
 
 //定义一个协议
 protocol PortocolNewTwo{
 //声明示例方法
 func logName ()
 //声明静态方法
 static func logClassName()
 }
 
 protocol SubProcotol:PortocolNewTwo{
 //此协议中自动继承 PortocolNewIwo 协议中约定的方法
 }
 

 
 协议中还有一个语法点需要读者注意，如果需要协议中约定的属性或者方法可选择是否实现，则可以将其声明为optional类型，同时，需要将整个协议用@obje关键字修饰，示例代码如
 
 
 
 */
            





//定义一个协议
protocol PortocolNewTwo {
    //声明实例方法
    func logName()
    //声明静态方法
    static func logClassName()
}

//协议可以被类、结构体等数据类型遵守。如果开发者需要使某个协议只能被类遵守，可以使用AnyObject关键字

protocol SubProcotol:AnyObject,PortocolNewTwo {
    //此协议中自动继承PortocolNewTwo协议中约定的方法
}

@objc protocol ClassProcotol:AnyObject {
    //此协议方法可选实现 即遵守协议的类可以实现也可以不实现
    @objc optional func log()
}

//由于协议可以继承，因此协议也可以使用 is、as！、as?等关键字进行检查与转换。

//-------------------协议与扩展的结合------------------------//

/*
 
 通过扩展也可以为协议中约定的属性方法提供默认的实现
 
 在扩展中为其约定的属性方法提供一套默认的实现，这样所有遵守此协议的数据类型都获取到了扩展中的默认实现
 
 */

class ClassNewTwo: PortocolNewTwo {
    var name: String
    var age: Int
    init(){
        name = "HS"
        age = 24
    }
    func logName() {
        print(name)
    }
    static func logClassName() {
        print("ClassNewTwo")
    }
}

var array:Array<MyProtocol>

/*
 简达泛型在实际编程中的意义：
 
 泛型的 “泛，是泛指的意恩。在编程中，尤其是在某些集合类型中，我们常常不能明确指定其类型，比如某个数组要存放多种类型的对象，这时候就需要使用泛型！
 
 泛型有其灵活的一面，但是不能滥用泛型，使用泛型会丢失编译器的类型检查功能。
 
 泛型配合as和is类型转换与类型检查关键字可以在十分灵活的情况下保证代码的安全性
 
 
 
 在Swift中，协议是怎样的一种语法，有什么使用场景？
 
 1协议是用来声明属性或方法的一种语法结构，在协议中，并没有属性和方法的定义，只有声明，这些声明的属性和方法需要类来遵守协议并实现。
 
 2协议中声明的方法可以标记为必须实现和选择实现，对于必须实现的方法，如果类遵守了此协议，则必须实现它们，选择实现的方法可以按照需要来实现。
 
 
 3面向协议编程是一种非常现代的编程思路，在开发项目时，我们可以先把要设计的功能接口定义为协议，之后编写具体的类来实现协议。这样的优势是无论之后类的实现怎么修改，接口协议只要确定，外界就不需要关心，降低了耦合性。
 
 */
