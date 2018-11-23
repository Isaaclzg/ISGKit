//
//  ISGCommonViewController.m
//  ISGKit
//
//  Created by Isaaclzg on 05/07/2018.
//  Copyright (c) 2018 Isaaclzg. All rights reserved.
//

#import "ISGCommonViewController.h"
#import "ISGCommon.h"

@interface ISGCommonViewController ()

@end

@implementation ISGCommonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    BOOL isIPhoneX = iPhoneX;
    
    NSLog(@"是否是iphoneX以上：%@\n屏幕的宽高：%f,%f",(isIPhoneX ? @"是" : @"否"),kScreenWidth,kScreenHeight);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
