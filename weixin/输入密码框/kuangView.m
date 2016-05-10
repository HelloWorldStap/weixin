//
//  kuangView.m
//  meituan
//
//  Created by apple on 16/5/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "kuangView.h"
#import "NNInPassWordView.h"
@interface kuangView()<NNInPassWordViewDelegate>
@property(nonatomic,strong)UIImageView *imageview;
@property(nonatomic,strong)UILabel *lable;
@property(nonatomic,strong)UIButton *butten;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *lable1;
@property(nonatomic,strong)UILabel *lable2;
@property(nonatomic,strong)NNInPassWordView *nnview;
@end
@implementation kuangView
-(instancetype)init
{
    if (self=[super init]) {
        [self changeUi];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self =[super initWithCoder:aDecoder ]) {
        [self changeUi];
    }
    return self;
}
-(void)changeUi;
{

    self.layer.masksToBounds =YES;
    self.layer.cornerRadius = 5*Kscr;
    self.backgroundColor = [UIColor whiteColor];
    self.imageview = [[UIImageView alloc]init];
    [self addSubview:self.imageview];
    self.lable = [[UILabel alloc]init];
    self.lable.text = @"请输入密码";
    [self addSubview:self.lable];
    self.butten  =[[UIButton alloc]init];
    [self.butten addTarget:self action:@selector(resignFromSuper) forControlEvents:UIControlEventTouchUpInside];
    [self.butten setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
    [self addSubview:self.butten];
    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor =[UIColor colorWithRed:239/255.0  green:237/255.0 blue:237/255.0 alpha:1];

    [self addSubview:self.lineView];
    self.lable1 = [[UILabel alloc]init];
    self.lable1.textAlignment = NSTextAlignmentCenter;
    self.lable1.font = [UIFont systemFontOfSize:12*Kscr];
    [self addSubview:self.lable1];
    self.lable2 = [[UILabel alloc]init];
    self.lable2.textAlignment = NSTextAlignmentCenter;
    self.lable2.font = [UIFont systemFontOfSize:18*Kscr];
    [self addSubview:self.lable2];
    self.nnview = [[NNInPassWordView alloc]init];
    self.nnview.delegate = self;
    [self.nnview benginInput];
    [self addSubview:self.nnview];

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageview.frame = CGRectMake(10*Kscr, 10*Kscr, 15*Kscr, 15*Kscr);
    self.lable.frame = CGRectMake(CGRectGetMaxX(self.imageview.frame)+5*Kscr, 0, 200*Kscr, 45*Kscr);
    self.butten.frame = CGRectMake(self.frame.size.width-25*Kscr, 5*Kscr, 20*Kscr, 20*Kscr);
    self.lineView.frame = CGRectMake(0, 45*Kscr, self.frame.size.width, 1);
    self.lable1.frame = CGRectMake(0, CGRectGetMaxY(self.lineView.frame)+10, self.frame.size.width, 20*Kscr);
    self.lable2.frame = CGRectMake(0, CGRectGetMaxY(self.lable1.frame)+10, self.frame.size.width, 20*Kscr);
    self.nnview.frame = CGRectMake(22.5*Kscr,  CGRectGetMaxY(self.lable2.frame)+10, 300*Kscr, 50*Kscr);


}
-(void)nnInPassWordView:(NNInPassWordView *)nnInPassWordView passWordStr:(NSString *)passWord
{
    [self.deleget postNetWorking:passWord];
    
//    self.pwdStr = passWord;

}
-(void)settitle:(NSString *)title withMoey:(NSString *)money
{
    self.lable1.text = title;
    self.lable2.text =money;

}
-(void)clearNNpwd
{
    [self.nnview clearpwd];
}
-(void)resignFromSuper
{
    [self.superview removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
