# ISGKit


[![Version](https://img.shields.io/cocoapods/v/ISGKit.svg?style=flat)](https://cocoapods.org/pods/ISGKit)
[![License](https://img.shields.io/cocoapods/l/ISGKit.svg?style=flat)](https://cocoapods.org/pods/ISGKit)
[![Platform](https://img.shields.io/cocoapods/p/ISGKit.svg?style=flat)](https://cocoapods.org/pods/ISGKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

ISGKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ISGKit'
```

## Use
1. 打开你的Xcode工程. 在Supporting Files目录下,选择 File > New > File > iOS > Other > PCH File 然后点击下一步；
2. 给你的PCH文件起名字TestDemo-Prefix.pch. 例如你的项目工程名为TestDemo然而你的PCH 文件的名字应该为 TestDemo-Prefix.pch,然后创建；
3. 选择 PCH 文件
4. 找到 Project > Build Settings > 搜索 “Prefix Header“；
5. “Apple LLVM 7.0 -Language″ 栏目中你将会看到 Prefix Header 关键字；
6. 输入: YourProjectName/YourProject-Prefix.pch (如 TestDemo/TestDemo-Prefix.pch )；
7. 将Precompile Prefix Header为YES，预编译后的pch文件会被缓存起来，可以提高编译速度。效果如下![image](http://oodl5p9nn.bkt.clouddn.com/C002691E-2D0C-4E45-B1B0-C6180F0879BA.png)
8. Clean 并且 build 你的项目.
9. 在TestDemo-Prefix.pch中引入 
```
#import "ISGCommon.h"
```


## Author

Isaaclzg, isaac_gang@163.com

[简书](https://www.jianshu.com/u/7e1b920cdac1)
## License

ISGKit is available under the MIT license. See the LICENSE file for more info.
