//
//  ViewController.m
//  TestCutOut
//
//  Created by apple on 16/6/7.
//  Copyright © 2016年 qiantu. All rights reserved.
//

#import "ViewController.h"
#import "BearCutOutView.h"
#import <BearSkill/BearConstants.h>
#import <BearSkill/UIView+BearSet.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor blueColor].CGColor,
                             (__bridge id)[UIColor orangeColor].CGColor,
                             (__bridge id)[UIColor redColor].CGColor,
                             (__bridge id)[UIColor greenColor].CGColor,
                             (__bridge id)[UIColor purpleColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0.5, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 1);
    gradientLayer.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    [self.view.layer addSublayer:gradientLayer];
    
    
    //  cutOutView_1
    
    BearCutOutView *cutOutView_1 = [[BearCutOutView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    [cutOutView_1 setUnCutColor:[UIColor yellowColor] cutOutFrame:CGRectMake(50, 50, 100, 100)];
    [self.view addSubview:cutOutView_1];
    
    
    //  cutOutView_2
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(50, 50)];
    [bezierPath addLineToPoint:CGPointMake(150, 120)];
    [bezierPath addLineToPoint:CGPointMake(60, 180)];
    [bezierPath closePath];
    
    BearCutOutView *cutOutView_2 = [[BearCutOutView alloc] initWithFrame:CGRectMake(50, cutOutView_1.maxY + 50, 200, 200)];
    [cutOutView_2 setUnCutColor:[UIColor purpleColor] cutOutPath:bezierPath];
    [self.view addSubview:cutOutView_2];
}

@end
