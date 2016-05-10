//
//  NNInPassWordView.m
//  密码框
//
//  Created by 方树风 on 16/4/27.
//  Copyright © 2016年 方树风. All rights reserved.
//

#import "NNInPassWordView.h"


#define HorizontalLineColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]
#define VerticalLineColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]
#define PointColor [UIColor colorWithRed:0 green:0 blue:0 alpha:1]
#define PointWidth 10
#define topAndBottomLineHeight 1
#define VerticalLineWidth 1
#define duration    0.3f

@interface pointModel :NSObject
@property(nonatomic,weak )UIImageView *icon;
@property(nonatomic,weak )UILabel *desc;
@end

@implementation pointModel
@end

@interface NNInPassWordView ()<UITextFieldDelegate>

@property(nonatomic,weak ) UITextField *passTefid  ;
@property(nonatomic,weak )UIImageView *topLine  ;
@property(nonatomic,weak )UIImageView *bootomLine  ;
@property(nonatomic,strong)NSMutableArray  *verticLineArray;
@property(nonatomic,strong)NSMutableArray  *pointArray;

@end
@implementation NNInPassWordView

-(NSMutableArray *)verticLineArray
{
    if (_verticLineArray == nil) {
        _verticLineArray  =[NSMutableArray array ];
    }
    return _verticLineArray;
}

-(NSMutableArray *)pointArray
{
    if (_pointArray == nil) {
        _pointArray  =[NSMutableArray array ];
    }
    return _pointArray;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setConfig];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setConfig];
    }
    return self;
}
-(void)setConfig
{

    self.isShowNumber = NO;
    _contentNumCount = 6;
    UITextField *passTefid = [[UITextField alloc]init];
    passTefid.keyboardType = UIKeyboardTypeNumberPad;
    passTefid.delegate  =self;
    passTefid.hidden = YES;
    [self addSubview:passTefid];
    self.passTefid = passTefid;
    
    UIImageView *topLine = [[UIImageView alloc]init];
    topLine.backgroundColor = HorizontalLineColor;
    [self addSubview:topLine];
    self.topLine  = topLine;
    
    UIImageView *bootomLine = [[UIImageView alloc]init];
    bootomLine.backgroundColor = HorizontalLineColor;
    [self addSubview:bootomLine];
    self.bootomLine = bootomLine;
    
    [self addPoints];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textfiletext) name: UITextFieldTextDidChangeNotification object:nil];
   
}

-(void)addPoints
{
    if (self.verticLineArray.count) {
        [self.verticLineArray removeAllObjects];
    }
    
    if (self.pointArray.count) {
        [self.pointArray removeAllObjects];
    }
    
    for (int i = 0; i < self.contentNumCount+1; i++) {
        UIImageView *verticLine = [[UIImageView alloc]init];
        verticLine.backgroundColor = VerticalLineColor;
        [self addSubview:verticLine];
        [self.verticLineArray addObject:verticLine];
    }
    
    for (int i = 0; i < self.contentNumCount; i++) {
        
        UILabel *pointNum = [[UILabel alloc]init];
        pointNum.hidden  = YES;
        pointNum.textColor = [UIColor blackColor];
        pointNum.font = [UIFont boldSystemFontOfSize:10];
        pointNum.textAlignment = NSTextAlignmentCenter;
        [self addSubview:pointNum];
        
        UIImageView *point = [[UIImageView alloc]init];
        point.backgroundColor = PointColor;
        point.hidden  = YES;
        point.clipsToBounds = YES;
        [self addSubview:point];
        
        pointModel *pointItem = [[pointModel alloc]init];
        pointItem.icon = point;
        pointItem.desc = pointNum;
        [self.pointArray addObject:pointItem];
    }

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
    CGFloat selfheight = self.frame.size.height;
    CGFloat selfWidth = self.frame.size.width;
    
    
    self.passTefid.frame = self.bounds;
    
    self.topLine.frame = CGRectMake(0, 0, selfWidth+1, topAndBottomLineHeight);
    
    
    self.bootomLine.frame = CGRectMake(0, selfheight - topAndBottomLineHeight,selfWidth+1, topAndBottomLineHeight);
    
    
    CGFloat itemWidth = self.frame.size.width / self.contentNumCount ;
    
    for (int i = 0 ; i < self.verticLineArray.count; i++) {
        UIImageView *line  = self.verticLineArray[i];
        line.frame = CGRectMake(itemWidth * i , topAndBottomLineHeight, VerticalLineWidth,selfheight - topAndBottomLineHeight * 2);
    }
    
    for (int i = 0 ; i < self.pointArray.count; i++) {
        pointModel *pointItem  = self.pointArray[i];
        pointItem.icon.layer.cornerRadius = PointWidth / 2;
        pointItem.icon.frame = CGRectMake(itemWidth / 2 + itemWidth * i - PointWidth / 2, selfheight / 2 - PointWidth / 2, PointWidth, PointWidth);
        pointItem.desc.frame = CGRectMake(itemWidth / 2 + itemWidth * i - PointWidth / 2, selfheight / 2 - PointWidth / 2, PointWidth, PointWidth);
    }
}

#pragma mark -细节处理
-(void)showToNmum:(NSString *)realStr nowInputContent:(NSString *)sting
{
    for (int i = 0 ; i < self.pointArray.count; i++) {
        pointModel *pointItem  = self.pointArray[i];
        if (i < realStr.length) {
            if (self.isShowNumber) {
                if (pointItem.icon.hidden) {
                    pointItem.icon.alpha = 0.0;
                    [UIView animateWithDuration:duration animations:^{
                        pointItem.desc.hidden = NO;
                        pointItem.desc.text = sting;
                        pointItem.icon.alpha = 1.0;
                        pointItem.icon.hidden = NO;
                    } completion:^(BOOL finished) {
                        
                    }];
                }
            }else{
                pointItem.desc.hidden = YES;
                pointItem.icon.hidden = NO;
            }
        }else{
                pointItem.desc.hidden = YES;
                pointItem.icon.hidden = YES;
        }
        
    }
}
#pragma mark UITextFieldDelegate

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    NSString *oldStr = textField.text;
    NSString *realStr;
    if (string.length) {//过滤掉删除键
        if (oldStr.length >= self.contentNumCount) {//超过最大值
            realStr =  [textField.text stringByReplacingCharactersInRange:range withString:string];
            return NO;
        }
    }
    
    realStr =  [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    [self showToNmum:realStr nowInputContent:string];
    return YES;
}

#pragma mark - public 
-(void)benginInput
{
    [self.passTefid becomeFirstResponder];
}
-(void)exitInput
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(nnInPassWordView:passWordStr:)]) {
        [self.delegate nnInPassWordView:self passWordStr:self.passTefid.text];
    }
    if (self.completeBlock) {
        self.completeBlock(self.passTefid.text);
    }
    [self.passTefid resignFirstResponder];
}
-(void)editComplete:(void (^)(NSString *))completeBlock
{
    
    self.completeBlock = completeBlock;
}
#pragma mark - set property
-(void)setContentNumCount:(int)contentNumCount
{
    NSAssert(contentNumCount > 0, @"个数请大于0----友情提示");
    if (contentNumCount != _contentNumCount) {
        _contentNumCount = contentNumCount;
        [self addPoints];
    }
}

-(void)setIsShowNumber:(BOOL)isShowNumber
{
    _isShowNumber = isShowNumber;
}
-(void)setHorizontalLineColor:(UIColor *)horizontalLineColor
{
    if (horizontalLineColor==nil) {
        return;
    }
    if (horizontalLineColor != _horizontalLineColor) {
        _horizontalLineColor = horizontalLineColor;
        self.topLine.backgroundColor = horizontalLineColor;
        self.bootomLine.backgroundColor = horizontalLineColor;
    }
}

-(void)setVerticalLineColor:(UIColor *)verticalLineColor
{
    if (verticalLineColor==nil) {
        return;
    }
    if (verticalLineColor != _verticalLineColor) {
        _verticalLineColor = verticalLineColor;
        
        for (UIImageView *verticLine in self.verticLineArray) {
            verticLine.backgroundColor = verticalLineColor;
        }
    }
}

-(void)setPointColor:(UIColor *)pointColor
{
    if (pointColor==nil) {
        return;
    }
    if (pointColor != _pointColor) {
        _pointColor = pointColor;
        
        for (pointModel  *pointItem in self.pointArray) {
            pointItem.icon.backgroundColor = pointColor;
        }
    }
}

-(void)setBackNumColor:(UIColor *)backNumColor
{
    if (backNumColor==nil) {
        return;
    }
    if (backNumColor != _backNumColor) {
        _backNumColor = backNumColor;
        
        for (pointModel  *pointItem in self.pointArray) {
            pointItem.desc.textColor = backNumColor;
        }
    }
}

-(void)setKeyboardType:(UIKeyboardType)keyboardType
{
    _keyboardType = keyboardType;
    self.passTefid.keyboardType = keyboardType;
}

#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self exitInput];
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self benginInput];
}
-(void)textfiletext
{
    NSLog(@"%@",self.passTefid.text);

    
    if (self.passTefid.text.length==self.contentNumCount) {
        [self.delegate nnInPassWordView:self passWordStr:self.passTefid.text];

    }
}
-(void)clearpwd
{
    self.passTefid.text = nil;
    for (pointModel  *pointItem in self.pointArray) {
        pointItem.desc.hidden = YES;
        pointItem.icon.hidden=YES;
    }

    
}
@end
