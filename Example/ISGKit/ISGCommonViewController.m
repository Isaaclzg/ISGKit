//
//  ISGCommonViewController.m
//  ISGKit
//
//  Created by Isaaclzg on 05/07/2018.
//  Copyright (c) 2018 Isaaclzg. All rights reserved.
//

#import "ISGCommonViewController.h"
#import <ISGKit/ISGKit.h>

@interface ISGCommonViewController ()

@end

@implementation ISGCommonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString *string = @"";
    BOOL isEmpty = [ISGTools isEmptyString:string];

    if (isEmpty) {
        NSLog(@"空的");
    }else {
        NSLog(@"不是空的");
    }
    NSString *string2 = @"ABC的风格";
    CGFloat height = [ISGTools textHeight:string2 font:[UIFont systemFontOfSize:13]];
    NSLog(@"height:%f",height);
    
    UIButton *button = [UIButton zg_customButton];
    [self.view addSubview:button];
    button.frame = CGRectMake(100, 200, 100, 100);
    button.backgroundColor = UIColor.randomColor;
    button.zg_ignoreEventInterval = 5;
    [button addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didClick:(id)sender {
    NSLog(@"点击按钮");
    UIButton *button = (UIButton *)sender;
    [button zg_shake];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
