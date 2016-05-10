//
//  kuangView.h
//  meituan
//
//  Created by apple on 16/5/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BaseView.h"
@protocol kuangViewDeleget<NSObject>
@required
-(void)postNetWorking:(NSString *)pwd;
@end
@interface kuangView : BaseView
@property(nonatomic,strong)NSString *pwdStr;
-(void)settitle:(NSString *)title withMoey:(NSString *)money;
@property(nonatomic,assign)id<kuangViewDeleget>deleget;
-(void)clearNNpwd;
@end
