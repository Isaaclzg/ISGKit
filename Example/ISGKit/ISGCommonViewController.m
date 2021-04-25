//
//  ISGCommonViewController.m
//  ISGKit
//
//  Created by Isaaclzg on 05/07/2018.
//  Copyright (c) 2018 Isaaclzg. All rights reserved.
//

#import "ISGCommonViewController.h"
#import <ISGTools.h>

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
