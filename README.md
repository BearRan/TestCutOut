# TestCutOut
BearSkill中BearCutOutView挖空UIView的方法演示


扫描二维码的界面或者特定的View需要做挖空处理，在StackOverFlow上找了一番，发现了一些有用的方法，并且整理了一下。


----------


挖空效果图
-----

![这里写图片描述](http://img.blog.csdn.net/20160608171511437)


----------


核心代码
----

> Demo地址： https://github.com/BearRan/TestCutOut

```
- (void)drawRect:(CGRect)rect
{
[super drawRect:rect];

//  设置View的fill颜色
[self.unCutColor setFill];
UIRectFill(rect);

//  获取上下文，并设置混合模式->kCGBlendModeDestinationOut
CGContextRef context = UIGraphicsGetCurrentContext();
CGContextSetBlendMode(context, kCGBlendModeDestinationOut);

//  设置挖空路径
UIBezierPath *path;
path = [UIBezierPath bezierPathWithRect:[self.cutOutFrame CGRectValue]];
[path fill];

//  执行混合模式
CGContextSetBlendMode(context, kCGBlendModeNormal);

}
```


----------


如何快速使用该方法
---------
> BearSkill地址：https://github.com/BearRan/BearSkill
> 欢迎fork

- 集成'BearSkill'
```
pod 'BearSkill'
```
- 导入头文件
```
#import <BearSkill/BearCutOutView.h>
```
- 挖空方法一：使用Frame挖空
```
//  cutOutView_1
//  unCutColor为非挖空区域的颜色
//  cutOutFrame为挖空的区域

BearCutOutView *cutOutView_1 = [[BearCutOutView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
[cutOutView_1 setUnCutColor:[UIColor yellowColor] cutOutFrame:CGRectMake(50, 50, 100, 100)];
[self.view addSubview:cutOutView_1];
```
- 挖空方法二：使用BezierPath挖空
```
//  cutOutView_2
//  unCutColor为非挖空区域的颜色
//  cutOutPath为挖空的区域

//设定挖空区域
UIBezierPath *bezierPath = [UIBezierPath bezierPath];
[bezierPath moveToPoint:CGPointMake(50, 50)];
[bezierPath addLineToPoint:CGPointMake(150, 120)];
[bezierPath addLineToPoint:CGPointMake(60, 180)];
[bezierPath closePath];

BearCutOutView *cutOutView_2 = [[BearCutOutView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
[cutOutView_2 setUnCutColor:[UIColor purpleColor] cutOutPath:bezierPath];
[self.view addSubview:cutOutView_2];
```

原创文章，欢迎提出意见或者建议。联系QQ：648070256