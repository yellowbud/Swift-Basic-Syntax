import UIKit
import CoreGraphics
/*
 用于完成实例构造的方法被称为构造方法。
 析构方法是构造方法的逆过程，一个实例被销毁和释放的过程由析构方法来完成。
 
 在Swift语言中，类和结构体在构造完成前，必须完成其中存储属性的构造与初始化。
 swift语言中的构造方法没有任何返回值
 
 要求结构体和类必须在构造方法结束前完成其中存储属性的构造 （延时存储属性除外），因此，在设计类时，往往采用两种方式来处理存储属性：
 
 在类和结构体中声明存储属性时直接为其设置初始默认值。
 在类和结构体的构造方法中对存储属性进行构造或者设置默认值。
 
 */

/*
class MyClass {
    //声明属性时直接进行赋值
    var count:Int = 0 {
        willSet{
            print("willSet")
        }
    }
    var name:String{
        didSet{
            print("didSet")
        }
    }
    //自定义构造方法
    init(){
        //必须对name属性进行赋值
        name = "HS"
    }
}
*/

//在对存储属性设置默认值或者在构造方法中对其构造时，并不会触发属性监听器，只有在构造完成后，再次对其赋值时才会触发。

/*
 上面的示例代码中，init（）方法为不带参数的构造方法，Swift语言中所有的构造方法都需要使用init（）来标识，开发者可以通过函数重载来创建适用于各个场景的构造方法。
 
 Swift 语言官方文档建议开发者：
 如果一个类或结构体的大多数实例的某个属性都需要相同的值，开发者应该将其设置为这个属性的初默认值。这样做可以很好地利用编译器的类型推断功能，减少代码冗余，使代码结构更加紧凑。
 
 另一方面，如果某个属性在逻辑上是允许为nil的，开发者可以将其声明成Optional类型，对于Optional类型的属性，如果在构造方法中不进行赋值，则会被默认赋值为ni， 示例代码如下：
 
 */

class MyClass {
    //声明属性时直接进行赋值
    var count:Int = 0 {
        willSet{
            print("willSet")
        }
    }
    var name:String{
        didSet{
            print("didSet")
        }
    }
    var opt:Int?
    //自定义构造方法
    init(){
        //必须对name属性进行赋值
        name = "HS"
        //没有对opt进行赋值操作，也没有赋初始值，默认被赋值为nil
    }
}
/*
 常量属性也必须在实例构造完成前被构造完成，一旦常量属性被赋值，则不能再被修改，例如下面的代码会使编译器报出错误：
 class MyClass {
    let name:String = ""
    init(){
        //这里对常量再次赋值会使编译器报错
        name = "HS"
    }
 }

 如果类或者结构体中的所有存储属性都有初始默认值，那么开发者不显式地提供任何构造方法，编译器也会默认自动生成一个无参的构造方法init(),在进行类型的实例化时，构造出来的实例所有属性的值都是默认的初始值，示例代码如下：
 */



class MyClassTwo{
    var age = 25
    var name = "HS"
}
//使用默认的init构造方法进行实例的构造
var obj = MyClassTwo()
//将打印age:25name:HS
print("age:\(obj.age)name:\(obj.name)")

/*
 
 和类不同的是，对于结构体，开发者可以不实现其构造方法，编译器会默认生成一个构造方法，将所有属性作为参数，示例代码如下：
 
 struct MyStruct {
     var age:Int = 0
     var name:String
 }
 //结构体默认生成带参的构造方法
 var st = = MyStruct (age: 24,name:"HS")
 
 如果为值类型结构（例如结构体）提供了一个自定义的构造方法，则系统默认生成的构造方法将失效，这样设计的初衷是为了安全性方面考虑，防止开发者调用自定义的构造方法时误调用到系统生成的构造方法，并且，对于值类型，构造方法可以嵌套使用
 
*/
struct MyStruct {
    var age:Int = 0
    var name:String
    init(age:Int,name:String){
        self.age = age
        self.name = name
    }
    //这个构造方法中调用其他构造方法
    init(){
        self.init(age:24,name: "HS")
    }
}
//使用无参的构造方法依然可以将age设置为24 name设置HS
var st = MyStruct()
print("age:\(st.age)name:\(st.name)")


//-----------------指定构造方法与便利构造方法--------------------------//

/*
 
 对于类来说，构造方法有指定构造方法与便利构造方法之分。
 
 指定构造方法Designated，前面示例中所用到的构造方法都是指定构造方法，指定构造方法不需要任何关键字修饰。
 指定构造方法是类的基础构造方法，任何类都要至少有一个指定构造方法
 
 便利构造方法Convenience，便利构造方法需要使用 Convenience 关键字
 便利构造方法则是为了方便开发者使用，为类额外添加的构造方法
 
 便利构造方法最终也要调用指定构造方法。
 
 
 
 
 关于指定构造方法与便利构造方法，Swift语言中有这样的原则：
 
 子类的指定构造方法中必须调用父类的指定构造方法。
 便利构造方法中必须调用当前类的其他构造方法。
 便利构造方法归根结底要调用某个指定构造方法。
 
 Swif语言官方文档中提供了一张示意图，见图 图9-1指定构造方法与便利构造方法的关系
 
 
 
 下面通过代码来演示类中构造方法的3条原则，示例代码如下：
 
 */

//创建一个类作为基类
class BaseClass {
    //提供一个指定构造方法
    init(){
        print("BaseClass Designated")
    }
    //提供一个便利构造方法 
    //便利构造方法必须调用当前类中的其他构造方法，并最终调用到指定构造方法
    convenience init(param:String){
        print("BaseClass Convenience")
        //进行指定构造方法的调用
        self.init()
    }
}
//创建一个BaseClass的子类
class SubClass:BaseClass{
    //覆写指定构造方法中必须调用父类的指定构造方法
    override init(){
        super.init()
    }
    //提供两个便利构造方法
    convenience init(param:String) {
        //最终调用到某个指定构造方法
        self.init()
    }
    convenience init(param:Int){
        //调用另一个便利构造方法
        self.init(param:"HS")
    }
}
var obj2 = SubClass() //#打印输出 BaseClass Designated




//-------------构造方法的继承关系----------//
/*
 方法是与特定类型关联被赋予特殊意义的函数，同样，构造方法又是类中一种特珠的方法。关于构造方法的继承关系，也有严格的原则规范，并且在继承关系中，构造方法的应用十分灵活。
 
 1.在继承关系中，如果子类没有覆写或者重写任何指定构造方法，则默认子类会继承父类所有的指定构造方法。
 2.如果子类中提供了父类所有的指定构造方法（无论是通过继承方式还是覆写方式），则子类会默认继承父类的便利构造方法。
 
 第1个原则实际上说明子类如果定义了自己的指定构造方法，或者覆写了父类的某个指定构造方法，则子类不再继承父类所有的指定构造方法；
 第2个原则可以这样理解：由于所有便利构造方法最终都要调用指定构造方法，因此只要子类提供了这个便利构造方法需要调用的指定构造方法，这个便利构造方法就会被继承。
 
 覆写父类的指定构造方法需要使用override 关键字，和普通方法的覆写一样。但是便利构造方法并不存在覆写的概念，便利构造方法必须调用类本身的其他构造方法，因此无论子类中定义的便利构造方法与父类是否相同，其都是子类独立的构造方法。
 
 使用代码演示构造方法的继承关系，示例代码如下：
 
 */

//创建一个基类
class BaseCls {
    //提供两个指定构造方法
    init(){
        print("BaseCls init")
    }
    init(param:Int){
        print("BaseCls init\(param)")
    }
    //提供一个便利构造方法
    convenience init(param:String){
        //调用其他构造方法
        self.init()
    }
}
//此类中不进行任何构造方法的定义 默认会继承父类的所有构造方法
class SubClsOne:BaseCls{
    
}

//这个类中对父类的无参init()指定构造方法进行的覆写
class SubClsTwo: BaseCls {
    //覆写了无参的init()构造方法，则不再继承父类其他构造方法
    override init(){
        super.init()
    }
}

//这个类没有覆写父类的构造方法，但是通过函数重载的方式定义了自己的构造方法
class SubClsThree:BaseCls{
    //重载了一个新的构造方法 则不再继承父类的其他构造方法
    init(param:Bool){
        super.init()
    }
}
//这个类覆写了父类的所有的指定构造方法 则会默认继承下来父类的便利构造方法
class SubClsFour:BaseCls{
    override init(param:Int){
        super.init(param:param)
    }
    override init(){
        super.init()
    }
}
/*
 如以上代码所示，BaseCls基类中提供了两个指定构造方法和一个便利构造方法。
 
 它的第1个子类SubCIsOne中没有定义任何构造方法，因此SubClsOne会默认继承BaseCls类中所有构造方法，包括两个指定构造方法和一个便利构造方法。
 
 BaseCIs类的第2个子类SubClsTwo中覆写了父类的无参构造方法，则SubClsTwo类中只有这一个构造方法 ，不再继承父类的其他构造方法。
 
 BaseCls类的第3个子类SubClsThree中没有覆写父类的任何构造方法，而是重载实现了自己的构造方法，则SubClsThree也不再继承任何父类的构造方法。
 
 BaseCls类的第4个子类SubClsFour中覆写了父类的所有指定构造方法，因此SubClsFour也会将父类的便利构造方法继承下来。
 
 这样设计Swif语言中的构造方法充分体现了 Swif语言对编程安全性的注重，这样做能够将开发者对构造方法误调的概率降到最低。
 
 
 有方法的覆写与重载两个概念，覆写和重载并不相同。覆写是子类对父类的方法重新实现，两者用了同一个方法，但是子类有了自己的功能。重載是使用已有方法相同的方法名，但通过设置不同的参数个数或参数类型来实现新的方法。
 
 */


//---------构造方法的安全性检查--------//
/*---
 Swift语言中的类在实例化完成后，可以保证所有存储属性的值都是开发者明确指定的。
 
 实际上，在类的构造方法中，编译器会进行4项安全性检查：
 
 检查1：子类的指定构造方法中，必须完成当前类所有存储属性的构造，才能调用父类的指定构造方法。此检查可以保证：在构造完从父类继承下来的所有存储属性前，本身定义的所有存储属性也已构造完成。
 
 检查2：子类如果要自定义父类中存储属性的值，必须在调用父类的构造方法之后进行设置。此检查可以保证：子类在设置从父类继承下来的存储属性时，此属性已构造完成。
 
 检查3: 如果便利构造方法中需要重新设置某些存储属性的值，必须在调用指定构造方法之后进行设置。此检查可以保证：便利构造方法中对存储属性值的设置不会被指定构造方法中的设置覆盖。
 
 检查4:子类在调用父类构造方法之前，不能使用self来引用属性（基类无所谓）。此检查可以保证在使用self关键字调用实例本身时，实例已经构造完成。
 
 上面的4项检查可以保证开发者在任何情况下使用类的实例时，其中的存储属性的值都是明确确定的，符合上达4项检查行为的示例代码如下，可以根据代码进一步理解检查的意义：
 
 //创建一个类作为基类
 class Check {
     var property: Int
     init(param:Int){
     property = param
     }
 }
 //创建继承与 Check 类的子类
 class SubCheck:Check{
     var subProperty:Int
     init(){
         //检查原则1：必须在调用父类的指定构造方法前完成本身属性的赋值
         subProperty = 1
         super.init(param:0)
         //检查原则2：如果子类要重新赋值从父类继承来的属性，必须在调用父类的指定构造方法后
         property = 2
         //检查原则 4：在完成父类的构造方法之后，才能使用 self 关键宇
         self.subProperty = 2
     }
     convenience override init(param: Int,param2: Int) {
         self.init()
         //检查原则3：便利构造方法中要修改属性的值必须在调用指定构造方法之后
         subProperty = param
         property = param2
     }
 }
 
 
 
 
 
 
 */


//-----------------可失败构造方法与必要构造方法------------------//
/*
 swift语言为了处理某些可能为空的值，引入Optional类型。对于类的构造方法，实际开发中经常有构造失败的情况。
 比如，一个构造方法可能需要一些特定情况的参数，当传递的参数不符合要求时，开发者需要让这次构造失败，这时就需要使用swift语言中可失败构造方法的相关语法。
 
可失败构造方法的定义：只需要使用init？（）即可，在实现可失败构造方法时，开发者可以根据需求返回nil 。示例代码如下：
 
 
 //创建一个类作为基类
 class Check {
     var property:Int
     init(param:Int){
         property = param
     }
     init?(param:Bool){
         //使用守护语句，当 param 为true 时才进行构造
         guard param else{
             return nil
         }
         property = 1
     }
 }
 //将返回nil
 var check = Check(param: false)
 
 
另外，开发者也可以设置某些构造方法为必要构造方法，如果一个类中的某些构造方法被指定为必要构造方法，则其子类必须实现这个构造方法 (可以通过继承或者覆写的方式），必要构造方法需要使用required关键字进行修饰，示例代码如下：
 
 class Check {
     var property:Int
     //此构造方法必须被子类实现
     required init(param:Int){
         property = param
     }
     init?(param:Bool){
         //使用守护语句，当 param 为true 时才进行构造
         guard param else{
             return nil
         }
         property = 1
     }
 }
 
 关于属性的构造，还有一个小技巧，如果某些属性的构造比较复杂，开发者可以通过闭包的方式来进行属性的构造，示例代码如下：
 
 class Check {
        var property:Int
    //此构造方法必须被子类实现
        required init (param: Int){
                property = param
        }
        //这个属性的构造使用闭包的方式进行
        var name:Int = {
            return 6+6
        }()
    }
 
 由于闭包是一个代码块，因此使用闭包的方式可以将多行功能代码组合起来使用，这对于复杂类型属性的构造十分方便。注意，闭包后面的小括号（）不可以漏掉，失去了小括号，这个属性就会变成一个只读的计算属性，本质就发生了变化。
 
 */


//创建一个类作为基类
class Check {
    var property:Int
    //此构造方法必须被子类实现
    required init(param:Int){
        property = param
    }
    init?(param:Bool){
        //使用守护语句 当param为true时才进行构造
        guard param else{
            return nil
        }
        property = 1
    }
    var name:Int = {
       return 6+6
    }()
    
    
}
//将返回nil
var check = Check(param: true)
check?.name
//创建继承与Check类的子类
class SubCheck:Check{
    var subProperty:Int
    init(){
        //检查原则1：必须在调用父类的指定构造方法前 完全本身属性的赋值
        subProperty = 1
        super.init(param: 0)
        //检查原则2：如果子类要重新赋值父类继承来的属性 必须在调用父类的指定构造方法后
        property = 2
        //检查原则4：在完成父类的构造方法之后，才能使用self关键字
        self.subProperty = 2
    }
    convenience init(param:Int,param2:Int){
        self.init()
        //检查原则3：便利构造方法中要修改属性的值必须在调用指定构造方法之后
        subProperty = param
        property = param2
    }
     required init(param:Int){
        subProperty = 0
        super.init(param: param)
    }
}

//------------------------------析构方法------------------------------------------//

/*
 
 析构方法与构造方法是互逆的，如果将构造方法理解为类实例的创建过程，则析构方法就是类实例的销毁过程。
 在实际开发中，经常需要在类实例将要销毁的时候，将其中用到的资源释放掉，如关闭文件等操作都会放入析构方法中进行。
 构造方法使用init（）来标识，析构方法使用deinit（）来标识。实例代码如下：
 
 */

class Temp {
    deinit{
        print("Temp实例被销毁")
    }
}
var temp:Temp? = Temp()
//当可选类型的类实例变量被赋值为nil时，实例会被释放
temp=nil


//1.设计游戏中的子弹和敌人类，假设这是一款一维直线上的射击游戏，敌人的移动速度是10单位/帧，子弹的飞行速度是30单位/帧，当子弹碰到敌人后，子弹和敌人同时销毁。
//设计子弹类
class Bullet{
    //提供一个属性描述子弹的位置
    var place:Int
    //提供一个类属性描述子弹的飞行速度
    static var speed:Int = 30
    //提供飞行方法描述飞行的行为
    func fly() {
        self.place += Bullet.speed
    }
    //提供一个构造方法
    init(place:Int) {
        self.place = place
    }
    //实现析构方法
    deinit {
        print("子弹命中")
    }
}

//设计敌人类
class Enemy{
    //提供一个属性描述敌人的位置
    var place:Int
    //提供一个类属性描述敌人逃逸的速度
    static var speed:Int = 10
    //提供一个方法描述敌人逃逸的行为
    func escape()  {
        self.place+=Enemy.speed
    }
    //提供一个构造方法
    init(place:Int) {
        self.place=place
    }
    deinit {
        print("敌人被击中")
    }
}

//创建子弹实例与敌人实例
var bullet:Bullet? = Bullet(place: 0)
var enemy:Enemy? = Enemy(place:300)
//记录追击回合
var i=0
//命中判断
while bullet!.place<enemy!.place {
    bullet!.fly()
    enemy!.escape()
    i+=1
    print("追击\(i)回合")
}
//将敌人和子弹一起销毁
bullet=nil
enemy=nil

/*
 简述Swift中构造方法的特点。
 
 1.构造方法是类中比较特殊的一个方法，在构造实例时会调用。
 
 2.构造方法不需要使用func关键字声明，且必领命名为 init
 
 3.swift 是一种语法十分严格的语言，在构造方法执行完成之前，必须保证非 Optional类型的存储属性赋值完成。
 
 4.swift 中的构造方法分为指定构造方法和便利构造方法，其中指定构造方法是基础的构造方法，便利构造方法是为了方便开发者调用的构造方法，便利构造方法最终要调用指定构造方法。
 
 5.在 Swift 中，类实例的构造可能失败，使用 init？定义的构造方法允许构造失败。
 
 6.如果某个构造方法必须被子类实现，则可以更用required 修饰
 
 7.与构造方法对应，Swift 中的析构方法在对象销毀前会被调用
 
 
 */


