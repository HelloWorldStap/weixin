//
//  enterPwdView.h
//  meituan
//
//  Created by apple on 16/5/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BaseView.h"
//用发：创建之后点击右上角的x是取消就是移除   点击付款就是创建
@protocol enterPwdViewDeleget<NSObject>
@required
/*
 输入密码达到你设置的6位之后发送网络请求然后需要清空密码
 **/
-(void)NetWorkingPost:(NSString *)pwd;
@end
@interface enterPwdView : BaseView
/*
 设置抬头和文字
 **/
-(void)titleName:(NSString *)titleName withMoneyText:(NSString *)money;
@property(nonatomic,assign)id<enterPwdViewDeleget>deleget;
/*
 清空密码
 *
 */
-(void)clearPwd;
/**
 发送请求成功移除控件
 */
-(void)removeEnterView;
@end
