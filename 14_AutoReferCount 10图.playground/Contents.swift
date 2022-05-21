import UIKit

/*
 任意一个变量、一个常量，设计的一个结构体、一个类都将在内存中占有一定的存储空间。试想一下，如果不对内存空间进行合理地管理，随着软件运行时间的增长，最终将因为内存不足而造成灾难性的后果。因此，合理地进行内存管理对于编程语言来说至关重要，其决定了软件的运行性能。
 
 采用引用计数的方式来管理实例的内存空间。理解引用计数的实质可以帮助开发者减少编写会产生内存泄漏的代码。
 
 -------------------------自动引用计数---------------------------------
 
 自动引用计数 Automatic Reference Counting, ARC 解决内存管理问题的一种手段。
 
 在swift语言中，任何变量和常量都有作用域，普通变量和常量的作用城往往只在离其最近的大括号内。
 属性则特殊一些，其和具体的实例关联，和实例的生命周期保持一致。
 
 
 */



func Test() {
    //变量a的作用域为整个函数内
    var a = 10
    while a>0 {
        a -= 1
        //变量b的作用域为while循环块内 出了while循环 变量b将被销毁 其占用的空间将被释放
        var b = 2
    }
    if a<0 {
        //变量c的作用域为if语句块内，if语句块结束后，变量c将被销毁，其占用的空间将释放
        var c = 3
    }
}

class TestClass {
    //name属性与当前类的实例关联，其生命周期与当前类实例一致
    var name:String = "HS"
    deinit{
        print("TestClass deinit")
    }
}
//创建TestClass实例的时候，其中属性name被构造，为其分配内存空间
//var obj:TestClass? = TestClass()
////obj实例被销毁 其中属性也随同一起销毁 释放所占有的内存空间
//obj=nil

/*
 当一个量值脱离了其作用域，就会被销毁，其所占用的内存空间也会被释放。
 
 但如果某个量值在销毁前进行了数据传递，情况又会变成怎样呢？Swift语言中的数据传递分为两种，即值类型的数据传递和引用类型的数据传递。
 
 对于值类型的数据传递，其采用的是完全复制的原理，因此原数据的销毁与内存的释放并不会影响新数据，新数据占用的内存会在它本身的作用域结束时释放
 其过程如图所示：图10-1 值类型在数据传递时的内存管理情况
 
 
 使用代码来模拟图10-1中的过程，示例如下：
 */

//if true {
//    var a = 0
//    if true {
//        var b = 1
//        a = b
//    }
//    //此处变量b所占内存被释放
//}
////此处变量a所占内存被释放

/*
 引用类型的数据传递复杂一些，我们知道引用类型的数据传递并不会完全复制原数据，而是通过引用的方式对原数据进行访问，因此无论一个类实例被多少个变量所承载，其真正访问的内存都是同一个地方。引用类型的数据传递如图10-2所示 图10-2 引用类型在数据传递时的内存管理情况
 
 
 
 使用代码模拟图10-2中演示的场景，示例如下：
 */

//if true {
//    var a = TestClass()
//    if true {
//        var b = a
//    }
//    //此处变量b变量已经不存在 但是TestClass实例依然占有内存，没有被释放
//}
//此处变量a已经不存在，没有其他变量在引用TestClass()实例的，调用deinit方法，其所占内存被释放

/*
 通过图10-1与图10-2的演示，对于值类型的内存管理可能会更好理解，一个变量对应着一块内存，当变量被销毁时，内存也被释放。
 对于一块数据内存，当没有任何变量引用它时，它才会被释放。反之，只要有变量引用它，无论变量情况如何，它都不会被释放。
 系统是如何知道这块内存是否有其他变量在引用呢？
 这就用到了引用计数的内存管理技术，而ARC自动引用计数其实就是系统帮助开发者完成了引用计数的工作。
 
只要有其他量值对其进行了引用，它的引用计数就会加1，当一个量值解除对它的引用时，它的引用计数就会 -1 。而这个实例所对应的内存数据，当引用计数变成0时，它就会被销毀释放。
 
 引用计数的存在可以保证变量在使用时所引用的数据依然存在，示例代码如下：
 

 */


var cls1:TestClass?=TestClass()
//进行引用类型的值的传递
var cls2 = cls1
var cls3 = cls2
//cls2对实例的引用取消，由于cls1与cls3的引用还在 实例所占内存依然安全
//cls2 = nil
////cls1对实例的引用取消，由于cls3的引用还在 实例所占内存依然安全
//cls1 = nil
////cls3对实例的引用取消，此时不再有变量对实例进行引用 实例调用deinit方法，所占内存被释放
//cls3 = nil


//---------------------------循环引用及其解决方法-------------------------------//
/*
 对类实例进行不当的引用会造成内存泄漏，内存泄漏积累到一定程度就会给应用程序带来灾难性的后果。想要避免因循环引用造成的内存泄漏，首先需要理解为何会造成循环引用。
 先来看如下一段代码：
 
 class ClassOne {
    deinit{
        print("ClassOne deinit")
    }
}
 
 class ClassTwo {
        //ClassTwo 类中有一个 Classone 类的属性
        var cls:ClassOne?
        init(cls:ClassOne?){
            self.cls = cls
    }
    deinit {
        print("ClassTwo deinit")
    }
 }
 
 var obj: ClassOne? = ClassOne()
 var obj2: ClassTwo? = ClassIwo (cls: obj)
 //此时ClassTwo类中的cls属性依然在引用obj实例，因此obj实例所占内存没有释放
 obj = nil
 //此时 obj2 被释放，obj2 中的属性也都被释放，不再有谁引用 0bj，obj实例也被释放
 obj2 = nil
 
 上面的代码并没有造成循环引用，只是示范了在一个实例内部引用另一个实例，这个过程可以用图10-3表示。图10-3 一个类实例中对另一个类实例进行引用
 
 完成如图10-3所示的3个步骤后，obj和obj2实例所占用的内存都被释放，代码十分健康，通过析构方法的打印数据也可以证实上述过程。然而，如果ClassOne类中的某个属性对 ClassTwo实例进行了引用，会怎么样呢？示例代码如下：
 
 //循环引用
 class ClassOne {
    var cls：ClassTwo？
    deinit{
        print（“ClassOne deinit”）
    }
 }
 
 class ClassTwo {
    var cls:ClassOne?
    init(cls:ClassOne?){
        self.cls = cls
    }
    deinit{
        print ("ClassTwo deinit")
    }
 }
 
 var obj:ClassOne? = ClassOne()
 var obj2:ClassTwo? = ClassTwo (cls: obj)
 obj?.cls = obj2
 obj2 = nil
 obj = nil
 
 通过Xcode控制台的打印信息可以看出，obj1与obj2所占用的内存都没有被释放，代码中，开发者已经将obj1 obj2 都置为nil,但其所占据的的内存将无法释放，这便是循环引用最常出现的场景，上述产生循环引用的过程可以通过图10-4来理解。
 
 图10-4 两类实例相互引用示意图
 
 通过图10-4可以清楚地看出，对于两个相互引用的实例，一旦造成循环引用，则系统无法完成对其内存的释放与回收。
 在开发中如何避免和解决这种循环引用呢？swift语言中提供了弱引用关键字weak来处理这样的问题
 weak关键字的作用是在使用这个实例的时候并不保有此实例的引用，
 这样来说，普通的引用类型数据在传递时会使实例的引用计数加1，使用weak关键字修饰的引用类型数据在传递时不会使引用计数加1。将上面造成循环引用的代码改写如下：
 
 
 
 */

//循环引用
class ClassOne{
    //进行弱引用
    weak var cls:ClassTwo?
    deinit{
        print("ClassOne deinit")
    }
}
class ClassTwo{
    var cls:ClassOne?
    init(cls:ClassOne?){
        self.cls = cls
    }
    deinit{
        print("ClassTwo deinit")
    }
}

var obj:ClassOne? = ClassOne()
var obj2:ClassTwo? = ClassTwo(cls: obj)
obj?.cls = obj2
obj2=nil
obj=nil
//打印输出
//ClassTwo deinit
//ClassOne deinit

/*
 通过Xcode的打印信息可以看出，obj obj2所占用的内存都被释放。这里使用图10-5来解释弱引用的原理。
 
 图 10-5 使用弱引用解决循环引用
 
 通过分析可以理解，由于obj中对其进行的是弱引用，当0bj2实例被置为nil时，此时obj2的数据己经被销毁，内存已经被释放，如果之后又使用到obj中的obj2属性，将会造成意想不到的错误。
 
 弱引用还有一个特点，其只能修饰Optional类型的属性，被弱引用的实例释放后，这个属性会被自动设置为nil。那么问题来了，如果开发中使用到的属性是非Optional值类型的，又恰巧出现了循环引用的场景，开发者该如何处理呢？其实Swift语言中还提供了一个关键字unowned( 无主引用）来处理非Optional值类型属性的循环引用问题，示例代码如下：
 
 class ClassThree{
     //不是Optional指，不能进行弱引用，使用无主引用来代替
     unowned var cls:ClassFour
     init(cls:ClassFour){
         self.cls = cls
     }
     deinit{
         print("ClassFour deinit")
     }
 }
 
 class ClassFour{
        var cls:ClassThree?
        deinit{
            print("ClassThree deinit")
        }
    }
 var obj4:ClassFour? = ClassFour()
 var obj3:ClassThree? = ClassThree(cls: obj4!)
 obj4!.cls = obj3!
 obj3 = nil
 obj4 = nil
 
 无主引用与弱引用的最大区别在于
 无主引用总是假定属性是不为nil的，如果属性所引用的实例被销毁释放了，再次使用这个实例程序会直接崩溃。而弱引用则允许属性值为nil，如果属性所引用的示例被销毁释放了，此属性会当成Optional值nil来处理，不会崩溃。两者相比，弱引用更加兼容，无主引用更加安全，开发者可以根据具体需求选择使用。弱引用与无主引用原理示意图如图10-6与图10-7所示
 
 图 10-6 强引用与弱引用的关系 / 图10-7 强引用与无主引用的关系
 
 无主引用与隐式拆包语法相结合可以使两个类中互相引用的属性都是非Optional值，这也是无主引用最佳的应用场景，示例代码如下：
 
 
 
 */



class ClassThree{
    //不是Optional指，不能进行弱引用，使用无主引用来代替
    unowned var cls:ClassFour
    init(cls:ClassFour){
        self.cls = cls
    }
    deinit{
        print("ClassFour deinit")
    }
}
class ClassFour{
    //这与需要使用隐式拆包的方式
    var cls:ClassThree!
    init(){
        //在创建cls属性的时候 将当前类示例本身作为参数传入 
        //由构造方法的原则可知 在cls属性创建完成之前，不可以使用self属性
        //对于隐式解析类型的属性 上述原则可以忽略 其告诉编译器 默认此属性是构造完成的
        cls = ClassThree(cls: self)
    }
    deinit{
        print("ClassThree deinit")
    }
}
var obj5:ClassFour? = ClassFour()
obj5=nil



//--------------------闭包中的循号引用-----------------------------//
/*
 前列所举的循环引用示例中，都是两个类实例之问的相互引用。
 在一个类中，如果其有属性为闭包，则也可能产生类与属性之间的互相引用。
 闭包是一种特殊的语法结构，在其中使用的引用类型的实例都会使引用计数加1。因此，如果在闭包属性中使用self关键字，就会对当前类实例本身进行引用计数加1。由于此闭包又是当前类的一个属性，闭包属性无法销毁，当前类实例也就无法销毁。反过来，当前类实例无法销毁，闭包属性也无法销段。如此产生循环引用，将造成内存泄露。
 
 闭包中产生循环引用的示例代码如下：
 
 class MyClassSix{
    var name:String = "HS"
    lazy var closure:()->Void = {
        //闭包中使用引用值会使引用+1
        print(self.name)
    }
    deinit{
        print("ClassSix deinit")
    }
 }
 var obj6: MyClassSix? = MyClassSix()
 obj6?.closure
 ////并没有打印 deinit 方法中的信息
 obj6=nil
 
 
 
 为了解决这类情况产生的循环引用，Swift语言专门为闭包结构提供了捕获列表，来对闭包内使用到的变量或者实例进行弱引用或无主引用的转换。捕获列表在结构上需要紧跟在闭包的起始大括号后，使用中括号包围，修改上面的示例代码如下：
 */





class MyClassSix {
    var name:String = "HS"
    lazy var closure:()->Void = {
        //使用捕获列表对闭包中使用到的self进行无主引用的转换
        [unowned self]()->Void in
        //闭包中使用引用值会使引用+1
        print(self.name)
    }
    deinit{
        print("ClassSix deinit")
    }
}
var obj6:MyClassSix? = MyClassSix()
obj6?.closure
//通过打印信息可以看出 内存已经被释放
obj6=nil

//如果闭包的捕获列表中需要对多个引用类型的量值进行引用转换，使用逗号进行分隔即可。



