import UIKit
/*
 struct Car {
   var price:Int

  var brand:String
  var petrol:Int

  mutating func drive(){
       if petrol>0 {
           petrol -= 1
            print("drive 10 milo")
      }
   }
  
   mutating func addPetrol(){
        petrol += 10
      print("加了10单位油")
   }
}
在创建结构体后，结构体会默认生成一个构造方法供开发者使用，开发者可以在构造方法中完成对结构体的实例化，示例如下

创建一个汽车结构体 价格为100000 品牌为奔驰 初始油量10
var car = Car(price: 100000, brand: "奔驰", petrol: 10)
使用点语法获取car实例的属性
print("这辆\(car.brand)汽车价格\(car.price)，油量\(car.petrol)")

 类：引用类型，不会被复制，引用类型是通过引用计数来管理其生命周期的。
 
 其他所有数据类型（结构体 枚举）都是：值类型。如果值类型有数据传递，值类型总是被复制，实例会被复制一份，修改新的实例并不能修改原始的实例
 
  
 
创建另一个变量进行值的传递
var car2 = car
修改car2的价格
car2.price = 50000
 
将打印
carPrice:100000
car2Price：50000
 car实例与car2实例分别独立
 
 
 
print("carPrice:\(car.price)\ncar2Price\(car2.price)")



模拟汽车行路行为
for _ in 0...100 {
    if car.petrol==0 { 如果油量为0 进行加油行为
 car.addPetrol()
    }else{
       car.drive()
    }
}

*/
class ClassCar {
    //设置两个属性
    //价格
    var price:Int
    //品牌
    var brand:String
    //油量
    var petrol:Int
    //提供一个行路的方法
    func drive(){
        if petrol>0 {
            petrol -= 1
            print("drive 10 milo")
        }
    }
    //提供一个加油的方法
    func addPetrol(){
        petrol += 10
        print("加了10单位油")
    }
    //提供一个构造方法
    init(price:Int,brand:String,petrol:Int){
        self.price = price
        self.brand = brand
        self.petrol = petrol
    }
}

//-----------------------------类---------------------------//
//类与结构体创建属性与方法的代码基本一样。不同的是，在结构体中开发者并不需要提供构造方法，结构体会根据属性自动生成一个构造方法，而类则要求开发者自己提供构造方法，在init（）构造方法中，需要完成对类中所有属性的赋值操作。

// 创建类实例、访问类实例属性的方法，示例如下： 创建ClassCar实例
var classCar = ClassCar(price: 100000, brand: "宝马", petrol: 15)
//进行实例传递
var classCar2 = classCar
//修改classCar2
classCar2.price = 200000
//将打印
/*
 classCarPrice:200000
 classCar2Price200000
 */
print("classCarPrice:\(classCar.price)\nclassCar2Price\(classCar2.price)")
//访问属性
print("这辆\(classCar.brand)汽车价格\(classCar.price)，油量\(classCar.petrol)")
//调用方法
for _ in 0...100 {
    //如果油量为0 进行加油行为
    if classCar.petrol==0 {
        classCar.addPetrol()
        //进行行路行为
    }else{
        classCar.drive()
    }
}

/*
 类是引用类型，对类实例进行数据传递时,并不会产生复制行为。因此，如果将类实例传递给新的变量，修改新的变量会影响原始变量.正是由于类的这种特性，同一个类实例可以被多处引用共享。
 */


/*
 继承是类独有的特点，子类和父类通过继承关系进行关联，并且子类可以对父类进行扩展。不继承任何类的类被称为基类，继承而来的类被称为子类，其所继承的类被称为父类。
 子类会继承父类的属性和方法，子类也可以定义自己的属性和方法。
 
 */

//设计一个交通工具基类
class Transportation {
    //油量 默认提供10
    var petrol:Int = 10
    //提供一个行驶的方法
    func drive()  {
        //具体由子类实现
        if petrol==0 {
            self.addPetrol()
        }
    }
    //提供一个加油的方法
    func addPetrol() {
        petrol+=10
    }
}


//创建继承自Transportation类的汽车类
class Car: Transportation {
    //不同的汽车有不同的轮胎数 为汽车提供一个轮胎数的属性
    var tyre:Int
    //对父类的方法进行重写
    override func drive() {
        super.drive()
        print("在路上行驶了10km")
        self.petrol -= 1
    }
    init(tyreCount:Int) {
        tyre = tyreCount
    }
}

//创建继承自Transportation类的轮船类
class Boat:Transportation {
    //不同大小的轮船有不同的层数 为轮船提供一个层数的属性
    var floor:Int
    //对父类的方法进行重写
    override func drive() {
        super.drive()
        print("在海上行驶了50km")
        self.petrol -= 2
    }
    init(floorCount:Int) {
        floor = floorCount
    }
}


//创建继承自Transportation类的飞机类
class Airplane:Transportation {
    //不同飞机有不同的行驶高度 为飞机提供一个行驶高度的属性
    var height:Int
    //对父类的方法进行重写
    override func drive() {
        super.drive()
        print("在天上行驶了100km")
        self.petrol -= 5
    }
    init(height:Int) {
        self.height = height
    }
}

/*
 不同的交通工具的行驶行为不同，汽车是在路上行驶，轮船是在海上行驶，飞机是在天上行驶。因此，在各个子类中对父类的drive()方法进行了覆写。
 
 要对父类的方法进行覆写，需要使用override关键字声明，覆写的意义是将继承于父类的方法进行新的实现，需要注意，由于父类的drive（）方法中会 有油量判断与加油操作，
 因此子类在覆写父类的drive（）方法时，不能完全拼弃父类的实现。super关键字用于调用父类的方法。
 
 Car、Boat、 Airplane同时 调用了drive（）方法，却执行了其自身所覆写的方法。
 
 final关键字用于修饰某些终极的属性、方法或者类。被final修饰的属性和方法不能够被子类覆写，示例如下
 */

class Shape {
    final var center:(Double,Double)
    init(){
        center = (0,0)
    }
}

// 同样，如果不希望某个类被继承，也可以使用final关键字来修饰这个类，使其成为终极类
final class Shape1 {
    final var center:(Double,Double)
    init(){
        center = (0,0)
    }
}

//--------------------------开发中类与结构体的应用场景-----------------------------//
/*
 
 使用结构体来描述数据:
 
 要描述的数据类型     中只有少量的简单数据类型的属性。
 
 要描述的数据类型      在传递数据时需要以复制的方式进行。
 
 要描述的数据类型中的    所有属性在进行传递时需要以复制的方式进行。
 
 不需要继承另一个数据类型。
 
 除了上面列举的原则外，在其他情况下，开发者也应该考虑使用类而不是结构体来描达对象。

*/

//创建汽车对象
var car = Car(tyreCount: 4)
//创建轮船对象
var boat = Boat(floorCount: 3)
//创建飞机对象
var plane = Airplane(height: 3000)
//调用drive()使用方法 
car.drive()
boat.drive()
plane.drive()


/*
 如果要对值类型进行比较操作，应使用等于运算符“==”
 对引用类型进行比较操作，应使用等同运算符“===” 示例如下
 
 
 */
class TextClass {
    
}
var text1 = TextClass()
var text2 = text1
//将返回true
text1 === text2


/*
 Array String、Ditionary Set 这些数据类型都是来用结构体来实现的
 
 Artay、String、Dictionary、Set 在数据传递时总是会被复制。
 
官方文档有介绍：在开发者的代码中，复制行为看似总会发生。然而，swift 语言在幕后会控制只有绝对需要时才会进行真正的复制操作,以确保性能最优
 因此开发者在编写代码时没必要回避复制行为来确保性能
 */







/*
 1.设计一个学生类，为每个学生设计姓名，年龄，性别属性，为其提供两个一个学习的方法。
 */
//创建一个性别枚举
enum Sex{
    case 男
    case 女
}
class Student {
    //性别
    let sex:Sex
    //姓名
    let name:String
    //年龄
    let age:Int
    init(sex:Sex,name:String,age:Int){
        self.sex=sex
        self.name=name
        self.age=age
    }
    func study()  {
        print("读书······")
    }
}
//创建学生实力
let stu1 = Student(sex: .男, name: "珲少", age: 25)
//进行学习行为
stu1.study()



/*
 2.结合第1题中的学生类，设计一个班级类，班级类中需要有班级名，学生人数和班长3个属性，并设计转入学生与转出学生的方法。
 */
class Class {
    //班级名
    var name:String
    //学生人数
    var studentCount:Int
    //班长 需要为学生类
    var monitor:Student
    init(name:String,monitor:Student,studentCount:Int){
        self.name=name
        self.monitor=monitor
        self.studentCount=studentCount
    }
    func addStudent() {
        studentCount+=1
    }
    func deleteStudent() {
        if studentCount>0 {
            studentCount-=1
        }
    }
}

//创建一个学生作为班长
let monitor = Student(sex: .女, name: "莉莉", age: 24)
//创建一个班级实例
var class1 = Class(name: "三年一班", monitor: monitor, studentCount: 30)
//转入一个学生
class1.addStudent()

/*
 3.结合第1题中设计的学生类，设计一个老师类，为老师类提供一个教学科目，姓名和所教学生列表的属性，并为老师类提供一个教学方法，在教学方法中进行学生的学习行为。
 */
//设计科目枚举
enum Subject{
    case 数学
    case 外语
    case 语文
}
//设计老师类
class Teacher {
    let name:String
    let subject:Subject
    var studentArray:Array<Student>
    func teach()  {
        for item in studentArray {
            item.study()
        }
    }
    init(name:String,subject:Subject,students:Array<Student>){
        self.name = name
        self.subject = subject
        self.studentArray = students
    }
}
//创建3个学生
let student1 = Student(sex: .男, name: "Jack", age: 24)
let student2 = Student(sex: .男, name: "Nake", age: 23)
let student3 = Student(sex: .女, name: "Lucy", age: 23)
let studentArray = Array(arrayLiteral: student1,student2,student3)
//创建老师实例
let teacher = Teacher(name: "Jaki", subject: .数学, students: studentArray)
//进行教学活动
teacher.teach()

/*
 1.在 Swift 语言中结构体和类有什么异同？
 
 结构体是一种值类型,对于值类型，每次对它的修改都会重新构建一个新的结构体实例，并且在传值时会总是进行复制，
 
 类是一种引用类型,传递的是引用，修改的自身
 
 结构体不可以继承，类可以继承。
 
 
 
 2.如何设计一个类？
 
 类是大多数面向对象语言的核心，对象都是由类构造出来的。
 
 类的最大用途是描述事物。描述事物的方式有两种：
 一种是描述事物的状态，例如物体的形状 颜色、重量等：另一种是描述事物的行为，例如运动、睡眠、飞行、扩散等。
 事物的状态在类中使用属性定义，事物的行为在类中使用方法定义。
 
 属性的实质是量值，方法的实质是函数。
 在类中，所有对象公用的属性可以定义为类属性（或静态属性），类直接调用的方法可以定义为类方法。
 类的对象中的属性通常被称为实例属性，类的对象调用的万法通常被称为实例方法。
 
 设计类时，要先分析清楚想要描述的事务，将有效的事务的状态映射成为属性并定义好属性的类型，将行为定义成方法，并逐个对方法进行测试。
 在编写类时，要遵守强封装、低耦合的原理，在类中暴露最少的接口，最少对外部进行依赖。
 
 
 
 
 
 */
