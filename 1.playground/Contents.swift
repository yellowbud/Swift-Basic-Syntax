import UIKit
import SpriteKit

let days = 365.25
Int(days) //365 类型转化并不是真正改变数据类型

//在运算符两边放同样数量的空格
6.2 + 1.4
6.2+1.4

//只能在相同数据类型的变量/常量使用算数运算
Int(1.9) //1
Int(0.1) //0

//取模运算符%
//判断一个数是偶数 evenNumber % 2 等于0        oddNumber % 2 等于1

/*复合赋值运算符
a += b把b加到a上，新的值保存在a里   a = a + b

 a -= b a=a-b
 a *= b a=a*b
 a /= b a=a/b
 

*/

/*
 大于或等于
 3 + 4 >= 7 //true
 3 + 4 > 7 //false
 
 
 
 */
// 一旦if或else if语句的某个部分的条件被证实是true，后续的其他条件就不会再做检查了

/*
 隐形解包可选值
 
 在某些极罕见的情况下，一个变量必须是可选值又始终有值。这样的话，就不用每次使用时解包，而是可以声明它为隐形解包可选值。告诉计算机这个变量是可选值，但始终是有值的，因此一个隐形解包的可选值每次使用之前就不需要解包了，它会自动为你解包。
 
 普通的可选值是在数据类型后面 ？ ，而隐性解包的可选值是在数据类型后面跟上 ！
 
 nil聚合运算符 ？？
 */

/*
 从字典中删除一个元素：可以通过把那个值赋值为 nil
 */

/*
 
 没有返回值的函数有时会被叫做 void 空函数。
 
 在定义函数参数的时候，必须要声明函数应该期待的数据类型，这个地方是不存在类型推断的
*/


func invite(guest: String){
    print("dearing\(guest)")
    print("welcome to my place \n")
}

func invite(allGuests:[String]){
    for guest in allGuests{ //使用for-in循环遍历allGuests数组
        invite(guest: guest) //对字符串数组allGuests里的每一位客人调用单独的invite（guest：）函数 。invite（guest：）和invite（allGuests：）是不同的函数，输入参数不同
    }
}

let friends = ["d","m","j","m"]
invite(allGuests: friends)

/*
 
 有些参数有标签，有些没有。没有参数标签也能让代码清晰可读，可以在函数定义中明确忽略掉 print（“swift”）
 
 默认情况下，每个参数都有一个参数标签，参数标签和参数名字是相同的。
 
*/

/*
 如果在函数内部的return语句之后还写了其他代码，那些代码是不会被执行的，因为return语句被执行后便退出了函数
 */

//求和计算平均值
func averageOf(_ scores:[Int])-> Int {
    var sum = 0
    for score in scores {
        sum += score
    }
    if scores.count > 0 { //如果数组是空的，任何数都不能除以0
        return sum / scores.count
    } else { //还需要在scores.count为0时返回一个值，否则我们会得到错误，指出函数缺少返回值
        return 0
    }
}
averageOf([77,76]) //76 计算结果是Int类型数据

/*
class BirthdayCake {//swift数据类型BirthdayCake,数据类型始终以大写字母开头，比如Double String
    let birthdayAge = 8
    let birthdayName = "Jude"
    var feeds = 20
}
let myCake = BirthdayCake() //创建一个BirthdayCake的实例，然后保存在常量myCake里
 */
//创建一个BirthdayCake的实例,需要用到初始化方法。初始化方法是一个特殊的方法，在创建类的新实例的时候会被调用，用来设置实例的属性。我们使用了默认初始化方法来创建蛋糕属性，这个初始化方法就是在BirthdayCake()的空括号，意思是 这个新的myCake实例的属性会使用之前在类定义里初始化它的默认属性

/*
 初始化方法是类定义里的一个特殊方法，作用是创建类的实例。
 默认情况下，类总是会有一个隐藏的初始化方法，如果有默认值的话，就会用默认的属性来创建类的实例。这就是我们创建myCake时所用的BirthdayCake()。这对空括号代表了默认初始化方法。我们在创建myCake时，它的属性值被设置为默认值。
 
 
 */

/* 用初始化方法设置属性的值
 
 class BirthdayCake {
    let birthdayAge:Int
    let birthdayName:String
    var feeds = 20
    
    init(){
    birthdayAge = 6
    birthdayName = "Dagmar"
    print("\(birthdayName)的蛋糕已经做好了！")
            }
 }
 
 
 init（）是一个特殊类型的函数。它可以有任意数量的输入参数，但是永远没有返回值。
 

*/

/*
 
 创建有输入参数的初始化方法。可以自定义初始化方法，用不同的值来给birthdayAge和birthdayName属性做初始化
 */
class BirthdayCake {
   let birthdayAge:Int
   let birthdayName:String
   var feeds = 20
   
   init(){
   birthdayAge = 6
   birthdayName = "Dagmar"
   print("\(birthdayName)的蛋糕已经做好了！")
           }
    
    init(age: Int, name: String){ //创建了需要两个输入参数的初始化方法。有多个初始化方法是可以的，但是每个方法必须具有不同的输入参数
        birthdayAge = age //直接用赋值把BirthdayCake类的属性设置为了对应的参数值
        birthdayName = name
        print("\(birthdayName)的蛋糕已经做好了！")
        }
    
    func message(shouldIncludeAge: Bool) -> String { //写在类内部的方法可以访问类的属性。方法和属性都位于类的内部，具有相同的作用域。所以在message（shouldIncludeAge: ）里可以直接使用birthdayAge 和 birthdayName ，而不需要作为参数传进去
        if shouldIncludeAge {
            return "Happy \(ordinalAge()) Birthday \(birthdayName)!"
        }
        return "Happy Birthday \(birthdayName)"
    }
    
    func ordinalAge() -> String {
        var suffix = "th"
        let remainder = birthdayAge % 10 //取模运算符计算出birthdayAge除以10后得到的余数，并赋值给remainder。余数是birthdayAge的个位数，它将告诉我们birthdayAge是否以1 2 3 结尾的。
        switch remainder {
        case 1:
            if birthdayAge != 11 {
                suffix = "st"
            }
        case 2:
            if birthdayAge != 12 {
                suffix = "nd"
            }
        case 3:
            if birthdayAge != 13 {
                suffix = "rd"
            }
        default:
            break
        }
        return "\(birthdayAge)" + suffix
    }
    
}
let twinCake = BirthdayCake(age: 11, name: "C and B")

let brownieCake = BirthdayCake(age: 11, name: "Gr")
brownieCake.message(shouldIncludeAge: true) //message(shouldIncludeAge:) 方法是一个实例方法，因为它只能在BirthdayCake的实例上使用

/*
 每个类的实例都有一个特殊的叫self的属性，它表示的是这个类的本身，可以被某个实例用来表示某个属性或者方法是它的。
 
 如果参数的名字和类中属性的名字相同，那么需要self关键字来告诉swift要用的是类中的属性而不是传进去的同名参数。
 
 只有当参数名字和属性名字相同时，才会使用self关键字。如果在构造方法时使用不用的参数名字，就可以避免使用self 比如：
 
 init （someDestination：String）{
        destination = someDestination 可以写成 self.destination = someDestination
 }
 */


class RocketShip {
    var destination: String //RocketShip类的实例的 destination 属性
    init(destination: String){ //定义了一个构造方法，它的参数名也是 destination 。初始化用这个 destination 参数值来创造 RocketShip 的实例。
        self.destination = destination
    }
}


let myRocketShip = RocketShip(destination: "Moon")
myRocketShip.destination







class FarmAnimal { //没有init（）方法。如果在 FarmAnimal 类中不创建自己的init（），默认情况下总会添加一个隐藏的init（）
    var name = "nongchangdongwu"
    var numberOfLegs = 4
    
    func sayHello() -> String {
        return "nihao,woshinongchangdongwu"
    }
    
    func description(){
        print("woshi \(name), woyou \(numberOfLegs)tiaotui")
    }
}


class Sheep: FarmAnimal {
    
    override init() { //覆盖sheep子类所继承的FarmAnimal父类的默认初始化方法。当子类覆盖所继承的方法时，表明子类会自己重新定义在父类中定义过的那个方法。override关键字表明父类中那个隐藏的init（）方法被覆盖了。当我们覆盖init（）方法时，我们首先需要调用FarmAnimal类的init（）方法，因为它设置了sheep类需要继承的属性和方法。
        super.init() //super关键字指的是这个实例的父类，就像self关键字指的是这个实例自己一样
        name = "mianyang"
    }
    
    override func sayHello() -> String { //
        return "咩咩"
    }
    
    override func description() { //
        super.description()
        print("wochuyngmao")
    }
}

let aSheep = Sheep()
aSheep.sayHello()
aSheep.description()



/*
 类型转换中 is 和 as。 is用来判断实例是否为特定的数据类型，而 as 用来把实例向下转换成某个子类的对象。
 */
class Chicken: FarmAnimal {
    var numberOfEggs = 0
    
    override init() { //初始化方法
        super.init()
        name = "母鸡"
        numberOfLegs = 2
    }
    
    override func sayHello() -> String {
        return "格格"
    }
    
    override func description() {
        super.description()
        print("我下蛋")
        if numberOfEggs == 1 {
            print("我现在有一个蛋给你")
        } else if numberOfEggs > 0 {
            print("我现在有\(numberOfEggs)个蛋给你")
        }
    }
    
    func layAnEgg(){ //只有要覆盖从父类继承来的函数面前要放override关键字
        numberOfEggs += 1
    }
    
    func giveUpEggs() -> Int {
        let eggs = numberOfEggs
        numberOfEggs = 0
        return eggs
    }
}
let chicken1 = Chicken()
chicken1.layAnEgg()
let chicken2 = Chicken()
chicken2.layAnEgg()
chicken2.layAnEgg()

//在swift中数组只能存放相同数据类型的元素。
let animals = [Sheep(),chicken1,chicken2,Sheep(),Chicken(),Sheep()] //每个元素都是FarmAnimal的子类，并且将这个数组类型设置为[FarmAnimal]
//现在可以用 is 关键字找出每个动物究竟是FarmAnimal的哪个子类了。用下面的代码遍历animal数组，根据不同的属性，打印不同的话
for animal in animals {
    if animal is Sheep {
        print("我的绵羊说 \(animal.sayHello())")
    } else if animal is Chicken {
        print("我的母鸡说 \(animal.sayHello())")
        let chicken = animal as! Chicken //我们必须把animal从FarmAnimal类用向下转换成Chicken子类，这可以用as关键字来实现。animal是Chicken数据类型，就可以用as关键字把它用向下类型转换成一个Chicken类的实例。把animal强制转换成Chicken数据类型是安全的，因为在做了 if animal is Chicken 检查后，我们已经知道这个animal是Chicken类的。
        //如果不确定这个animal是否是Chicken类的，那么应该在as加 ？
        chicken.layAnEgg()
        chicken.description()
    }
}

//---------用向下类型转换使类型更明确----------------//
/*
 当捡鸡蛋的时候，只需从Chicken类里捡，下面的代码就是只捡鸡蛋而不必区分是sheep类还是其他类

 */
var gatheredEggs = 0
for animal in animals { //在遍历数组时，我们并不知道每一个animal是否能被转换成Chicken数据类型
    if let chicken = animal as? Chicken { //只有当动物是Chicken对象时才能用 as！Chicken 转换成Chicken类型。如果动物是绵羊，这个if let语句就会被跳过。 得到Chicken类型的对象，就可以用Chicken类的giveUpEggs（）方法来捡鸡蛋
        chicken.layAnEgg()
        print("捡到 \(chicken.numberOfEggs)个鸡蛋")
        gatheredEggs += chicken.giveUpEggs()
    }
}
print("今天捡了 \(gatheredEggs)个鸡蛋！")

/*
 类可以让我们创建自己的数据类型，几乎可以和其他类型（Int Bool Double类型）一样使用。类和其他类型有一个很大不同：之前所有数据类型是 数值类型，类是引用类型，就是说在变量里保存数据的方式不同。
 
 当你创建类的实例变量时，会创建一个对象，并把这个对象保存在计算机内存的某个地方。如果你创建另一个新的变量，然后把第一个变量赋给它的话，实际发生的是让这个新的变量指向第一个实例在计算机内存的位置，于是这两个变量就都指向同一个对象了。如果你修改第一个变量，那么另一个变量也会变，因为它们都指向同一个对象。
*/
class Kid {
    var age: Int
    init(age: Int) {
        self.age = age
    }
}
var finn = Kid(age:9) //nathan 和 finn 都是类的变量，变量finn和 nathan 指向同一个Kid对象
var nathan = finn //nathan 和 finn 是同一个对象的两个名字。让不同的变量指向同一个对象往往是有用的，在这里，这是不同的人，应该为Nathan创建一个新的Kid对象 var nathan = Kid（age:10）,这样我们就有了一个新的不同的Kid类的实例nathan，改变它的属性不会影响另一个实例finn。finn 和 nathan 现在各自指向不同的Kid对象了。如果需要多个对象，就一定要确保将它们初始化为新的对象。
print("Nathan是 \(nathan.age)岁而Finn是 \(finn.age)岁")


//结构变量是值类型
struct Couch{
    var numberOfCushions = 3
    func description() -> String {
        return "这个沙发有\(numberOfCushions)个靠垫"
    }
}
var myFirstCouch = Couch() //
var mySecondCouch = myFirstCouch // mySecondCouch 包含 myFirstCouch 的值的副本
myFirstCouch.description()
mySecondCouch.description()

mySecondCouch.numberOfCushions = 4 //
myFirstCouch.description() //3
mySecondCouch.description() //4

/*
 当你需要保存一组有联系的值，并且这些值可以以值的方式（复制），而不是以引用的方式传递时，可以用结构。
 */

/*
 swift有Date的特殊数据类型，用于保存日期数据。一个Date对象实际包含了日期和时间
 */

let today = Date()
print(today)

//以特定的格式显示日期，要用日期格式器，创建DateFormatter类的对象，被赋予了特定的日期格式。DateFormatter是一个帮助对象，用来根据任何日期数据创建出对应的字符串。日期格式风格是DateFormatter的一个属性

let formatter = DateFormatter() //创建一个格式器
formatter.dateStyle = DateFormatter.Style.full //设置风格为Style.full,打印出星期几、月份、日期和年份
formatter.string(from: today) //用DateFormatter类的string（from：）方法创建了一个字符串 Friday,February 25,2022

/*
 5种DateFormatter.Style所对应的字符串格式
 */
formatter.dateStyle = DateFormatter.Style.none
formatter.string(from: today) //""

formatter.dateStyle = DateFormatter.Style.short
formatter.string(from: today) // "2/25/22"

formatter.dateStyle = DateFormatter.Style.medium
formatter.string(from: today) // "Feb 25, 2022"

formatter.dateStyle = DateFormatter.Style.long
formatter.string(from: today) // "February 25,2022"

/*
可以用DateFormatter的dateFormat属性来指定自己定义的显示日期的方式。假设只想要月份日期，不需要创建新的DateFormatter，只要修改格式器对象的dateFormat，然后再要求它生成新字符串
 */

formatter.dateFormat = "MM/dd"
formatter.string(from: today) //  "02/25"

formatter.dateFormat = "MM/dd/yyyy"
formatter.string(from: today) // "02/25/2022"

formatter.dateFormat = "MM.dd.yy"
formatter.string(from: today) // "02.25.22"

formatter.dateFormat = "EEE MMM dd"
formatter.string(from: today) // "Fri Feb 25" 用EEE显示星期几的缩写

formatter.dateFormat = "EEEE -*- MMMM dd -*- yyyy"
formatter.string(from: today) // 用EEEE完整显示星期几

/*
 核心数据(Core Data）是Apple的一个框架，用来保存和获取数据库中的数据。保存在核心数据中的对象必须都是NSMangedObeject类的的子类的对象。这样的子类叫作受管理对象，因为它们的生存周期是受核心数据框架管理的。
 
 也就是说不能用init（）方法来创建一个受管理的对象，而是需要用特殊的NSManagedObject构造方法来创建。
 
 每个App都有一个特殊的应用程序代理，会被自动创建为 AppDelegate 类的实例。这个应用程序代理负责管理应用程序的生命周期，也就是App在运行时所处的各种运行状态。
*/

var myDateComponents = DateComponents()
myDateComponents.month = 5
myDateComponents.day = 10
myDateComponents.year = 1971
myDateComponents.hour = 8
myDateComponents.minute = 23

let date11 = Calendar.current.date(from: myDateComponents)//我们在Calendar类中用date（from：）方法，从myDateComponents创建了一个日期。我们用Calendar.current获得了设备（手机）所用的日历类型。
/*
 要从Date 中取出 DateComponents，我们可以用 Calendar 的方法 dateComponents(_:from:)。这个方法有两个参数：第一个是DateComponents 的数组，就是你想要取出Date 的哪些数据，第二个是取数据所在的日期。如果你想要创建一个新的Date对象，是今天的日期，但是是早上8点而不是现在，那么这个dateComponents(: from：)方法就很有用了
 */

/*
 用SpriteKit的物理引擎。物理引擎处理游戏中的物理动作，比如重力如何起作用、物体的速度、物体与另一个物体碰撞后如何弹开等
 
 角色的通用模式:
 1.创建角色
 
 2.在屏幕上定位角色并设置其他初始值
 
 3.调用addChild()方法把角色添加到场景中去
 
 
 
 
 
 把一个角色（比如这里的滑板角色）加到场景里去的时候，计算机知道这个角色应该长什么样，但也就知道这些了。它不知道角色是轻是重、是粗糙是光滑，也不知道
 撞到其他物体时是否应该弹开。SpriteKit 有一个叫作SKPhvsicsBody的类，我们可以将它添加到角色上给角色形成物理体。
 
 在把物理体加到角色上之前，需要创建一个叫作SKPhysicsBody的类
 
 创建了一个半径为 30.0个像素点的圆形物理体
 let ballBody = SKPhysicsBody(circleOfRadius: 30.0)
 
 给盒子形状的角色创建了一个矩形的物理体。如果角色已经创建了，你就可以用角色的尺寸作为物理体的尺寸。这里用了一个假设的盒子角色来设置尺寸
 let boxBody = SKPhysicsBody（rectangleOf: box.size）
 
 
 通过提供texture（纹理）来创建物理体,这是在游戏开发中常用的一种图形格式。我们所创建的每个SKSpriteNode 都有一个texture 属
 性，无论用什么类型的文件(PNG、JPEG 等）来创建这个角色，我们都可以通过它来访问角色的纹理。用角色的纹理来创建它的物理体的话，SpriteKit 会自动检测纹
 理，找到所有的边，忽略掉图像透明的部分，然后创建一个按近于图像实际形状的物理体出来。纹理并不定义物理体的尺寸，因此我们还需要把物理体的尺寸设置为角色的尺寸
 
 let skaterBody = SKPhysicsBody(texture: skaterTexture, size: skater.size)
 
 角色的纹理是显示在屏幕上的东西，而物理体则决定了角色的行为。这两者并不
 定要完全一致，你可以给滑板角色设置一个圆形的物理体，那个角色看上去还是滑板角色，但是会像球一样地滚动。
 
 
 设置物理体的属性是为了向计算机描述物理体。比如一片云的密度非常小，受重力的影响相对较小。保龄球的密度很大，重力对它的影响很大
 
 SKPhysics Body的常见厲性
 
 mass 定义物体的质量。任何CGFloat值都可以用。只要在整个App里是一致的，具体的值关系不大
 
 friction 定义表面有多粗糙。比如，冰的摩擦系数很小，物体碰到它容易滑动。值的范围是0.0 ~ 1.0
 
 restitution 定义物体的弹性，用于物体相互碰撞的时候。值的范围是0.0~1.0，值越高弹性越好
 
 affectedByGravity 决定这个物体是否忽略受重力的影响
 
 allowsRotation 決定这个物体是否可以旋转
 
 */

let bowlingBall = SKPhysicsBody(circleOfRadius: 10.0)
bowlingBall.mass = 100.0
bowlingBall.friction = 0.3
bowlingBall.restitution = 0.1
bowlingBall.affectedByGravity = true
bowlingBall.allowsRotation = true

let basketball = SKPhysicsBody(circleOfRadius: 10.0)
basketball.mass = 12.0
basketball.friction = 0.5
basketball.restitution = 0.7
basketball.affectedByGravity = true
basketball.allowsRotation = true

let iceCube = SKPhysicsBody(rectangleOf: CGSize(width: 1.0, height: 1.0))
iceCube.mass = 7.0
iceCube.friction = 0.1
iceCube.restitution = 0.2
iceCube.affectedByGravity = true
iceCube.allowsRotation = false

/*
 
 applyForce(_:) 用于持续的力
 
 applyImpulse(_:) 用于一次性的力
 
 枚举（enumeration，也常简写为enum）是一种把相关的值组合起来形成新数据类型的方式。
 
 场景中所有的对象都是Spritekit 类型的节点，
 比如SKSpriteNode 类型或 SKLabelNode 类型，都可以给设一个名宇。除了可以访问场景中每个节点的类属性，你还可以给每个节点赋一个名字，这样以后就可以用它们的
 name属性来访问每个节点了。
 
 Timeinterval是一种 Double 类型，用来表示经过了多少秒。
 我们要在游戏循环里更新分数标签，但是不需要在游戏循环的每一轮都做更新（要记得这个循环是每秒30或60次）。
 
 常用的字符串格式说明符
 %d 用来插入一个 Integer类型数据
 
 %f 用来插入一个 Double、Float 或 CGFloat类型数据
 
 %@ 用来插入一个 String 类型数据或其他对象
 
 %% 用来在字符串中表示百分号本身
 
 
 
 含有数字的字符串格式说明符
 格式符    输入       输出
 
 %05d     123       00123
 %.2f     1.0        1.00
 %.3f     33.0       33.000
 
 String(format: "%04d", score)  用score变量创建出来的字符串。String 的构造方法String(format：)用一个字符串格式说明符把变量的值以特定的格式
 变成字符串。这里我们希望分数始终有4个数字，如果不足4位就在前面加0，比如当玩家得到230点的时候，显示0230而不是230。在字符串格式说明符 %04d中，％表示
 这里要插入一个变量，04表示始终保持4位数宇，不足4位的前面要补0，d表示要插入的变量是一个整数。
 
 在SpriteKit中，SKAction可以用来对节点做很多有趣的事情。
 
 SKAction的很多方法都有一个to版本和一个by版本，比如move(to:duration：）和move(by：duration:）。
 
 动作的to版本直接做动作而不需要考虑节点原来的状态。比如想要把一个角色移动到新的位置，比
 如屏幕的中央，就可以用to 版本，给出新的位置就可以了。无论这个节点原本是否在屏幕内，也不管是在新位置的左边还是右边，节点都会直按移动到那个位置去。
 
 如果想要让节点根据当前的位置移动，就要用by版本。比如想要让角色从现在的位置向右移动
 50.0，就要用move(by:duration：)，调用时x的值为 50.0。
 
 
 It is the application's dynamic data structure, independent of the user interface.It directly manages the data, logic and rules of the application.
 Model是应用程序的动态数据结构，独立于用户界面。它直接管理应用程序的数据、逻辑和规则
 Model负责管理应用程序的数据，从控制器接收用户输入
 
 View 表示信息的任何形式，如图表、图表或表格。
 View以特定的格式呈现模型。
 
  Accepts input and converts it to commands for the model or view
 Controller 接受输入并将其转换为模型或视图的命令。
  Controller 响应用户输入，并在data model objects上执行交互.
 Controller 接收输入，可选验证输入，然后将输入传递给模型
 */

