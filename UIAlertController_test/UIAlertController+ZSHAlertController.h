//
//  UIAlertController+ZSHAlertController.h
//  UIAlertController_test
//
//  Created by 维奕 on 2017/9/22.
//  Copyright © 2017年 维奕. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^actionHandler)(UIAlertAction *action, NSUInteger index);

@interface UIAlertController (ZSHAlertController)


/**
 弹窗   只有确定按钮  UIAlertControllerStyleActionSheet = 0,
 UIAlertControllerStyleAlert=1

 @param title 标题
 @param message 消息内容
 @param confirmActionHandler 确定按钮代码块
 @param vc 在VC上跳转
 @return 返回提示框
 */
+(UIAlertController *)alertTitle:(NSString *)title
                         mesasge:(NSString *)message
                  confirmHandler:(void(^)(UIAlertAction *confirmAction))confirmActionHandler
              showViewController:(UIViewController *)vc;



/**
 弹窗  有确定、消息按钮

 @param title 标题
 @param message 消息内容
 @param confirmBlock 确定代码块
 @param cancleBlock 取消代码块
 @param vc 在VC上跳转
 @return 返回提示框
 */
+(UIAlertController *)alertTitle:(NSString *)title
                         mesasge:(NSString *)message
                  confirmHandler:(void(^)(UIAlertAction *confirmAction))confirmBlock
                   cancelHandler:(void(^)(UIAlertAction *cancleAction))cancleBlock
              showViewController:(UIViewController *)vc;



/**
 弹窗中带输入框

 @param title 标题
 @param message 内容
 @param textFildBlock 输入框代码块
 @param confirmBlock 确定代码块
 @param cancleBlock 取消代码块
 @param vc 在VC上跳转
 @return 返回提示框
 */
+(UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message addTextField:(void(^)(UITextField *textFild))textFildBlock
                 confirmHandler:(void(^)(UIAlertAction *confirmAction))confirmBlock
                  cancelHandler:(void(^)(UIAlertAction *cancleAction))cancleBlock
             showViewController:(UIViewController *)vc;



/**
 弹框选择 sheet

 @param title 标题
 @param message 内容
 @param actionTitleArr 其他按钮选择标题数组
 @param actionHandler 按钮点击事件
 @param vc 在VC上跳转
 @return 返回弹框选择
 */
+ (UIAlertController *)actionSheettWithTitle:(NSString *)title
                                     message:(NSString *)message
                                actionTitles:(NSArray *)actionTitleArr
                               actionHandler:(actionHandler)actionHandler
                          showViewController:(UIViewController *)vc;

@end

