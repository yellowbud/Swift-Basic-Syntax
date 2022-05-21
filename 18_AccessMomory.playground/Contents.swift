
/*
 
 内存安全检查（独占访问权限）
 独占内存访问权限特性是一种编时和运行时的安全特性，其和数组也没有任何关系，当两个变量访问同一块内存时，会产生独占内存访问限制。
 
 
 */



//读访问
var name = "jaki"

//写访问
print(name)

/*
 如果符合如下3个条件，则程序会产生读写权限冲突
 
 （1） 至少有一个变量在使用写权限。
 2）变量访问的是同一个内存地址。
 3）持续时间有重叠。
 
 在开发中，可能会产生读写权限冲突的情况有3种：
 
 1.inout 参数读写权限冲突
 
 一般情况下，值类型的传参总会产生复制操作。inout参数则使得函数内可以直接修改外部变量的值。inout参数是最容易产生读写冲突的场景，例如下面的代码：
 
 var stepSize = 1

 func increment(_ number: inout Int) {
     number += stepSize//crash
 }

 increment(&stepSize)
 
 需要注意，上面的代码Playground中可能并不产生异常，这是一个运行时错误，
 
 在函数中,inout参数从声明开始到函数结束，这个变量始终开启着写权限，对应上面的代码，number参数开启着
 写权限，stepSize则进行了读访问，如此则满足上面的权限冲突规则，会产生读写冲突。同样，如
 果对两个inout参数访问同一个内存地址，也会产生读写权限冲突，例如：
 
 
 var stepSize = 1

 func increment(_ number: inout Int,_ number2: inout Int) {
     var a = number+number2
 }

 increment(&stepSize,&stepSize)
 
 */

/*
 2.结构体中自修改函数的读写冲突
 
 swift语言中的结构体也是一种值类型，因此其也存在该写冲突的场景，例如如下代码：
 
 struct Player {
     var name: String
     var health: Int
     var energy: Int

     let maxHealth = 10
     mutating func shareHealth(_ player:inout Player) {
       health = player.health
     }
 }
 var play = Player(name: "jaki", health: 10, energy: 10)
 play.shareHealth(&play)//产生错误
 
 上面的shareHealth函数中使用的health是对self自身的读访问，而inout参数是写访问，会产生读写权限冲突
 
 */


/*
 
 
 3.值类型中属性的读写访问权限冲突
 
 在Swift语言中，像结构体、枚举和元组中都有属性的概念。由于其都是值类型，因此在对不同的属性进行访问时都会产生冲突，例如：
 
 */
/*
class Demo {
    var playerInformation = (health: 10, energy: 20)
    func balance(_ p1 :inout Int,_ p2 :inout Int) {
        
    }
    func test()  {
        self.balance(&playerInformation.health, &playerInformation.energy)//crash
    }
}
let demo = Demo()
demo.test()

*/
/*
 看到这里你一定觉得这太严格了，对不同属性的访问也会产生读写冲突。实际上，在开发中大部分这种访问都被认为是安全的，需要满足下面3个条件：
 
 (1）访问的是存储属性，而不是计算属性
 （2） 访问的是结构体局部变量（函数中的变量），而不是全局变量。
(3）结构体不被闭包捕获，或者只是被非逃逸的闭包捕获。
 
 将上面的playerlnformation变量修改成局部的，程序就可以正常运行了：
 
 */

class Demo {
    
    func balance(_ p1 :inout Int,_ p2 :inout Int) {
        
    }
    func test() {
        var playerInformation = (health: 10, energy: 20)
        self.balance(&playerInformation.health, &playerInformation.energy)
    }
    
}

let demo = Demo()
demo.test()

/*
 其实，swift中的独占内存访问权限特性一般情况下我们都不会使用到。
 swift是一种安全性极高的语言，也是其设计的核心思想与方向，例如类构造方法的安全性检查、变量类型的安全限制特性等都将开发者编写代码的安全交给语言特性来负责，而不是开发者的经验。

 */



