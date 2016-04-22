//
//  ViewController.m
//  DrawTabulationView
//
//  Created by  江苏 on 16/4/22.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "TabulationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TabulationView* tabuView=[[TabulationView alloc]initWithFrame:CGRectMake(30, 50, 250, 250)];
    
    tabuView.backgroundColor=[UIColor lightGrayColor];
    
    [self.view addSubview:tabuView];
    
}



@end
