import UIKit

/*
 属性的实质是有特定意义的量值，只是属性是定义在类、结构体或者枚举中的量值.
 
 Swift语言中对于属性的定义分为两类，分别是存储属性与计算属性.
 
 存储属性:
 作用是存储类的某个特征
 只能用于类和结构体
 
 计算属性：
 作用 通过运算告知外界类的某个特征
 用于类 结构体 枚举
 
 
 方法也被分为实例方法与类方法,实例方法用于描述类型实例的行为，类方法用于描述整体类型的行为
 
存储属性用于描述存储值，计算属性用于描述计算过程并获取计算结果
 
 存储属性就是用变量或常量存储的某些有意义的值
 */

class Student {
    //定义姓名和年龄为变量存储属性 可以修改
    var name:String
    var age:Int
    //定义性别为常量存储属性 一旦学生实例被构造出来则不能再进行修改
    let sex:String
    //定义一个所在学校的存储属性 默认为安阳一中
    var schoolName = "安阳一中"
    //提供一个构造方法
    init(name:String,age:Int,sex:String)  {
        self.name = name
        self.age = age
        self.sex = sex
    }
}
/*
 在类中有一个原则，即当类实例被构造完成时，必须保证类中所有所有的属性都构造或者初始化完成。
 因此，会在创建的类中提供一个构造方法用于设置其中的属性，但并不是所有情况都需要这么做，我们也可以为类中的属性在声明时就提供一个初始值（ var schoolName = "安阳一中" ）
 
 变量类型的属性可以修改，常量类型的属性不可修改。
 但是对于值类型实例，如果实例是常量接收的，则其中变量的属性也不可以修改
 对于引用类型实例，无论实例是变量还是常量接收的，都可以修改变量类型的属性
 
 
 */



struct Point {
    var x:Double
    var y:Double
}

class PointC {
    var x:Double
    var y:Double
    init(x:Double,y:Double){
        self.x = x
        self.y = y
    }
}
let point = Point(x: 2, y: 1)
//下面的代码将引起编译器报出错误。对于值类型实例，如果实例是常量接收的，则其中变量的属性也不可以修改
//point.x = 3

let point2 = PointC(x: 2, y: 2) //对于引用类型实例，无论实例是变量还是常量接收的，都可以修改变量类型的属性
//类实例修改则没有问题
point2.y = 5

/*
 
 支持将存储属性设置为延时存储属性。所谓延时存储属性，是指在类实例构造的时候，延时存储属性并不进行构造或初始化，只有当开发者调用类实例的这个属性时，此属性才完成构造或初始化操作。
 例如一个类的某个属性可能是一种复杂的数据对象，这个属性要完成构造可能需要花费很长的时间，将其设置为延时构造属性将大大减少类实例的构造时间
 示例代码如下：
 
 */


class Work {
    var name:String
    init(name:String){
        self.name = name
        print("完成了Work类实例的构造")
    }
}
class People {
    var age:Int
    lazy var work:Work = Work(name: "teacher")
    init(age:Int){
        self.age = age
    }
}
//构造People类实例时 并没有打印Word类的构造信息
var people = People(age: 24)
//使用work属性时，才进了Work实例的构造
print(people.work)

/*
 在创建People类实例的时候，并没有进行work类实例的构造，在调用People实例的work属性时，才完成了work类的构造。
 
 延时存储属性并不是线程安全的，如果在多个线程中对延时存储属性进行调用，不能保证其只被构造一次。
 */

//------计算属性的意义及应用------//

/*
 计算属性更像是运算过程，用来描述这种可以由其他属性通过计算而得到的属性
 */


class Circle {
    //提供两个存储属性
    var r:Double //半径
    var center:(Double,Double) //圆心
    //提供周长与面积为计算属性
    var l:Double{ //周长
        get{
            return 2*r*Double.pi
        }
        set{
            r = newValue/2/Double.pi
        }
    }
    var s:Double{ //面积
        get{
            return r*r*Double.pi
        }
        //自定义传值名称
        set(myValue){
            r = sqrt(myValue/Double.pi)
        }
    }
    
    //提供一个构造方法
    init(r:Double,center:(Double,Double)){
        self.r = r
        self.center = center
    }
}

//创建圆类实例
var circle = Circle(r: 3, center: (3,3))
//通过计算属性获取周长与面积
print("周长是：\(circle.l);面积是：\(circle.s)")
//通过周长和面积来设置圆的半径
circle.l = 12*Double.pi
print(circle.r)
circle.s = 25*Double.pi
print(circle.r)
/*
 如上代码，圆的半径将影响圆的周长与面积，同样设置了圆的周长或者面积后，也将反过来影响圆的半径。
 
 计算属性中可以定义get与set方法，分别用来获取计算属性的值和设置计算属性的值。
 
计算属性本身没有存储值，它只是作为一个接口向外界提供某些经过计算后具有相应意义的数据。在计算过程中，通常会用到其他的存储属性。
在计算属性的set方法中，会将外界所设置的值默认以newValue的名字传入，可以直接进行使用，也可以为这个值设置自定义的名称
 
 
 
 
 
 
 
 关于计算属性的get与set方法，get方法是必不可少的，而set方法是可选的
 
 当一个计算属性只有get方法而没有set方法时，此计算属性是只读的，外界只能获取此计算属性的值，不能设置此计算属性的值
 
 class TestClass{
    var test:Int{
        get{
            return 10
        }
    }
 }
  */

var test = TestClass()
//对只读的计算属性进行设置会报出错误
//test.test = 10

//由于只读的计算属性没有set方法块，因此可以进一步简写，上面的代码可以简写如下：
class TestClass {
    var test:Int{
        return 10
    }
}

//-----------属性监听器---------//
/*
 在许多编程场景中，开发者在对类的某些属性进行赋值时需要进行一些额外的操作。
 Swift语言中的存储属性提供了属性监听器，以便让开发者赋值属性时执行额外操作。
 
 属性监听器用于监听存储属性赋值的过程，并且开发者可以在其中编写代码，添加额外的逻辑。
 在进行属性的构造或初始化时，无论是通过构造方法进行属性构造或初始化，还是为属性设罝默认值，都不会调用属性监听器的方法。初始化后从第2次为属性赋值开始，属性监听器才会被调用。示例代码如下：

 */

class Teacher {
    var name:String{
        //此属性将要被赋值时会调用的方法
        willSet(new){
            //其中会默认生成一个newValue来接收外界传递进来的新值
            print("将要设置名字为:\(new)")
        }
        //此属性已经被赋值后会调用的方法
        didSet(old){
            //其中会默认生成一个oldValue来保存此属性的原始值
            print("旧的名字为:\(old)")
        }
    }
    var age:Int
    init(name:String,age:Int){
        self.age=age
        self.name=name
    }
}
//构造时并不会打印属性监听器中的打印信息
var teacher = Teacher(name: "少", age: 24)
//会打印属性监听器中的打印信息 如下：
/*
 将要设置名字为:Jaki
 旧的名字为:少
 */
teacher.name = "Jaki" //初始化后从第2次为属性赋值开始，属性监听器才会被调用

//同样，开发者也可以为属性监听器中传入的值设置自定义的名称


//只有存储属性可以设置属性监听器，计算属性不可以。


//--------属性包装器-----//

/*
 使用属性包装器可以实现计算属性计算过程的复用
 例如定义一个会员类，其中将存储会员的名字和年龄，如果会员不设置名字或设置的名字是空的，则默认将其会员名重置为default，对于会员年龄，如果会员设置的值为负数，我们需要将其重置为0（需要符合年龄的实际意义）
 其实，并非只有会员类的名称和年龄属性需要有如上代码的检查逻辑，很多计算属性都会有类似的逻辑，我们可以将其封装为一个属性包装器，这样这个计算过程即可被复用
 
 
 
 */
@propertyWrapper //定义属性包装器，这个属性包装器的作用是确保属性赋值不小于0 。

struct MoreThanZero {
    private var number: Int
    init() { self.number = 0 }
    var wrappedValue: Int {
        get { return number }
        //对年龄做检查逻辑
        set {
            if newValue < 0 {
                self.number = 0
            } else {
                self.number = newValue
            }
        }
    }
}

 //定义属性包装器，这个属性包装器的作用是确保属性赋值不能为空字符串。
@propertyWrapper
struct NotEmptyString {
    private var value: String
    init() { self.value = "defaule" }
    var wrappedValue: String {
        get { return value }
        set {
            if newValue.count > 0 {
                self.value = newValue
            } else {
                self.value = "default"
            }
        }
    }
}

class Member:CustomStringConvertible {
    //内部存储属性
    private var name:String
    private var age:Int
    init() {
        self.name = "default"
        self.age = 0
    }
    
    //使用属性包装器来定义计算属性
    @NotEmptyString var memberName:String
    @MoreThanZero var memberAge:Int
    
    var description: String {
        return "\(self.memberName):\(self.memberAge)"
    }
}

let member1 = Member()
member1.memberAge = -1
member1.memberName = ""
//设置的不合法数据将无效，会输出：default:0
print(member1)



//---------------实例属性与类属性-----------------//
/*
 
 前面提到的所有属性实际上都是实例属性，实例属性由类的实例调用，类属性则直接由类来调用。
 
实例属性是与具体实例相关联的，一般用来描述类实例的一些特性，
 而类属性是与此类型相关联的，用来描述整个类型的某些特性。
 
类属性使用static或者class关键字来声明。使用static关键字声明的属性也被称为静态属性
 
 */


class SomeClass {
    //静态存储属性
    static var className = "SomeClass"
    //静态计算属性
    static var subName:String{
        return "sub"+className
    }
    class var classSubName:String{
        return "class" + subName
    }
}
//类属性不需要创建实例对象，直接使用类名来调用
SomeClass.className
SomeClass.subName
SomeClass.classSubName

//创建一个继承于SomeClass的子类
class SubClass:SomeClass{
    //对计算类属性的计算方法进行覆写，覆写需要使用 override 关键宇
    override class var classSubName:String{
        return "newNme"
    }
}
SubClass.classSubName

//类属性通常用来描述整个事物类所共享的一些事物特点，例如生产一批电视机，电视机的标准寿命值可以作为类属性。




//章节练习
/*
 1.设计一个直线结构体，为其提供中心点，长度，斜率3个计算属性。
 */
struct Line {
    //直线的两点
    var point1:(Double,Double)
    var point2:(Double,Double)
    var center:(Double,Double){
        return ((point1.0+point2.0)/2,(point1.1+point2.1)/2)
    }
    //sqrt为开平方函数 abs为绝对值函数
    var width:Double{
        return  sqrt(abs(point1.0-point2.0)*abs(point1.0-point2.0)+abs(point1.1-point2.1)*abs(point1.1-point2.1))
    }
    var k:Double{
        return abs(point1.1-point2.1)/abs(point1.0-point2.0)
    }
    init(point1:(Double,Double),point2:(Double,Double)){
        self.point1 = point1
        self.point2 = point2
    }
}

var line = Line(point1: (1,1), point2: (3,3))
line.center
line.width
line.k

/*
 Swift 在类中定义的属性有两种：存储属性和计算属性，它们有什么区别？
 
 1.存储属性主要用来进行数据的存储，在内存中需要为这个属性分配相应的空间
 2.计算属性主要用来定义计算的过程，不需要空间来存储数据
 3.计算属性与方法有些类似，它更多用来定义对象的某些状态，但这些状态可以通过其他更加基础的状态计算而来。
 
 
 
 
 怎么理解懒加载？
 
1懒加载是编程中常用的一种优化技巧。很多时候类示例中的属性是否真正创建与用户的操作逻辑有关，例如复杂对象的某个属性可能需要从本地文件进行读取，这是一个耗时的过程，并且并非用户每次都会用到这个属性，这时可以采用懒加载的方式，只有当使用到这个属性时才进行文件的读取。
 
 在 Swift 中，属性可以声明为延迟加载，延时加载属性就属于懒加载编程的一种，在对象构造时属性并不会被赋值，只有当使用到属性时才进行赋值。
 
 懒加载可以有效地加快对象的构造速度并且可以一定程度节省内存的使用。
 
 延时加载属性是Swift中对对象懒加载的一种实现方式，在编程中要尽量使用这种方式定义属性。
 
 
 */


