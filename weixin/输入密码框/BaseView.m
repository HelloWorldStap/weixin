//
//  BaseView.m
//  jiajiao
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

+(UIView *)viewFromXib:(NSString *)xib
{
    return [[[NSBundle mainBundle]loadNibNamed:xib owner:nil options:nil]lastObject];
}
-(void)maskboundwith:(NSArray *)array
{
[array enumerateObjectsUsingBlock:^(UIView * obj, NSUInteger idx, BOOL  * stop) {
    obj.layer.masksToBounds = YES;
    obj.layer.cornerRadius = 5*Kscr;
}];

}

@end
