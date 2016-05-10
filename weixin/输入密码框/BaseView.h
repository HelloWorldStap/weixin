//
//  BaseView.h
//  jiajiao
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
//屏幕宽度
#define KscrW [UIScreen mainScreen].bounds.size.width
#define Kscr KscrW/375

@interface BaseView : UIView
+(UIView *)viewFromXib:(NSString *)xib;
-(void)maskboundwith:(NSArray *)array;
@end
