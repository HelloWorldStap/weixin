//
//  enterPwdView.m
//  meituan
//
//  Created by apple on 16/5/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "enterPwdView.h"
#import "kuangView.h"
@interface enterPwdView()<kuangViewDeleget>
@property(nonatomic,strong)kuangView *kuangview;
@end
@implementation enterPwdView
-(instancetype)init
{
    if (self = [super init]) {
        [self changeUI];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self changeUI];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self changeUI];
    }
    return self;
}
-(void)changeUI
{
    
    self.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0.1];
    self.kuangview = [[kuangView alloc]init];
    self.kuangview.deleget = self;
    [self addSubview:self.kuangview];

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.kuangview.frame =CGRectMake(10*Kscr, 104*Kscr, 355*Kscr, 205*Kscr);
}
-(void)titleName:(NSString *)titleName withMoneyText:(NSString *)money
{
    [self.kuangview settitle:titleName withMoey:money];
}
-(NSString *)pwdString
{
    if (self.kuangview.pwdStr) {
        return self.kuangview.pwdStr;
    }
    return nil;
}
-(void)postNetWorking:(NSString *)pwd
{
    [self.deleget NetWorkingPost:pwd];
}
-(void)clearPwd
{
    [self.kuangview clearNNpwd];

}
-(void)removeEnterView
{
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
