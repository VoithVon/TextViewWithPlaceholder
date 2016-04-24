//
//  ViewController.m
//  TextViewWithPlaceholder
//
//  Created by 冯璐 on 16/4/12.
//  Copyright © 2016年 NIck_Von. All rights reserved.
//

#import "ViewController.h"
#import "FLTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

#pragma mark --------- 调用 FLTextView ---------
    
    FLTextView *textView = [[FLTextView alloc] initWithFrame:CGRectMake(50, 50, 280, 150)];
    
    textView.FLPlaceholder = @"请留下您的宝贵建议";
    textView.backgroundColor = [UIColor whiteColor];
    
    //设置边框颜色
    textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    textView.layer.borderWidth = 1.0;
    
    [self.view addSubview:textView];

}

//触摸回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
