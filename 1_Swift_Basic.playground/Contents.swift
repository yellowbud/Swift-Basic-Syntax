//引入UI开发框架
import UIKit
//定义一个变量 赋值为字符串"Hello, playground"
//声明字符串变量str

//对字符串变量str进行赋值
var str:String;str = "hello,playground";print(str)
//更改str变量的值
str = "newValue"
//在str字符串变量后边追加hello
str = str+"hello"

//进行量值的打印
print(str)
//声明定义了3个变量 整数类型变量a 浮点数类型变量b 字符串类型变量c
//编译器推断 同一行声明多个变量/常量
//var a=1,b=2.9,c="string"

//手动指定
var a2:Int=1,b2:Float=2.9,c2:String="string"
//声明3个Int类型的变量
var one,two,three:Int

//在一行中编写多句代码，用 ；对语句分隔
var st:String; st = "hello"; print(st)


//2.1.2变量和常量的命名规范
//常量变量属性首字母会小写，类名、枚举名、结构体名首字母会大写
//使用中文进行变量的命名
var 珲少 = "珲少"
//使用表情符号进行命名
var 😄 = "开心"
//含有数字的命名。穿插数字进行命名，数字不能作为开头
var pen2 = "钢笔"
//使用下划线进行命名
var _swift_ = "swift"
//驼峰命名
var userName = "珲少"
//用预留关键字进行命名
var `var` = 2


/*
 多行注释
 注释
 */

//注释的嵌套，示例如下

//单行注释//注释中的注释
/*
 多行注释
 /*
    注释中的注释
 */
 注释
 注释
 */


//章节练习
//1.使用两种类型指定方式分别创建Int型变量a=1、b=2。交换a和b的值。
var a:Int = 1
var b = 2
//中间变量进行交换
var c = a
a = b
b = c






