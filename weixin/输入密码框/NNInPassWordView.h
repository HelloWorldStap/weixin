//
//  NNInPassWordView.h
//  密码框
//
//  Created by 方树风 on 16/4/27.
//  Copyright © 2016年 方树风. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NNInPassWordView;
@protocol NNInPassWordViewDelegate <NSObject>

@optional
-(void)nnInPassWordView:(NNInPassWordView *)nnInPassWordView passWordStr:(NSString *)passWord;

@end
@interface NNInPassWordView : UIView
/**是否先显示输入的数字在隐藏 默认yes*/
@property(nonatomic,assign)BOOL isShowNumber;
/**密码框的位数 默认6位*/
@property(nonatomic,assign)int contentNumCount;
/** 设置水平线的颜色*/
@property(nonatomic,strong)UIColor *horizontalLineColor;
/**设置竖直的颜色*/
@property(nonatomic,strong)UIColor *verticalLineColor;
/**设置点的颜色*/
@property(nonatomic,strong)UIColor *pointColor;

/**设置显示字的颜色*/
@property(nonatomic,strong)UIColor *backNumColor;

@property(nonatomic,assign) UIKeyboardType keyboardType;

@property(nonatomic,weak )id<NNInPassWordViewDelegate>delegate;
@property(nonatomic,copy )void (^completeBlock)(NSString *passWordStr);
/**叫出键盘 */
-(void)benginInput;
-(void)exitInput;

-(void)editComplete:(void (^)(NSString *passWordStr))completeBlock;
-(void)clearpwd;
@end
