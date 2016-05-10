//
//  ViewController.m
//  weixin
//
//  Created by apple on 16/5/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "enterPwdView.h"
@interface ViewController ()<enterPwdViewDeleget>
@property(nonatomic,strong)enterPwdView *enview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    enterPwdView *VIEW = [[enterPwdView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:VIEW];
self.enview = VIEW;
    VIEW.deleget = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)NetWorkingPost:(NSString *)pwd;
{
    [self.enview clearPwd];

}



@end
