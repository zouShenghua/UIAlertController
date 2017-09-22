
//
//  UIAlertController+ZSHAlertController.m
//  UIAlertController_test
//
//  Created by 维奕 on 2017/9/22.
//  Copyright © 2017年 维奕. All rights reserved.
//

#import "UIAlertController+ZSHAlertController.h"

@implementation UIAlertController (ZSHAlertController)

//没有取消按钮
+(UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message confirmHandler:(void(^)(UIAlertAction *confirmAction))confirmActionHandler
              showViewController:(UIViewController *)vc{
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:confirmActionHandler];
    
    [alertController addAction:confirmAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
    
    
}


//有取消按钮的
+(UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message confirmHandler:(void(^)(UIAlertAction *confirmAction))confirmBlock
    cancelHandler:(void(^)(UIAlertAction *cancleAction))cancleBlock
              showViewController:(UIViewController *)vc
{
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:confirmBlock];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:cancleBlock];
    
    [alertController addAction:confirmAction];
    [alertController addAction:cancleAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
}

//带提示框的输入框
+(UIViewController *)alertTitle:(NSString *)title mesasge:(NSString *)message addTextField:(void(^)(UITextField *textFild))textFildBlock
                 confirmHandler:(void(^)(UIAlertAction *confirmAction))confirmBlock
                  cancelHandler:(void(^)(UIAlertAction *cancleAction))cancleBlock
             showViewController:(UIViewController *)vc{
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:confirmBlock];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:cancleBlock];
    
    [alertController addAction:confirmAction];
    [alertController addAction:cancleAction];
    
    //输入框
    [alertController addTextFieldWithConfigurationHandler:textFildBlock];
    
    [vc presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
    
    
}

//弹框选择
+ (UIAlertController *)actionSheettWithTitle:(NSString *)title
                      message:(NSString *)message
                 actionTitles:(NSArray *)actionTitleArr
                actionHandler:(actionHandler)actionHandler
           showViewController:(UIViewController *)vc{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];

    if (actionTitleArr.count > 0) {
        for (NSUInteger i = 0; i < actionTitleArr.count; i++) {
            UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitleArr[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)  {
                actionHandler(action, i);
            }];
            [alertController addAction:action];
        }
    }
    
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
    
}


//// ActionSheet的封装
//+ (UIAlertController *)p_showSheetAlertController:(NSString *)title
//                           message:(NSString *)message
//                       cancelTitle:(NSString *)cancelTitle
//                        titleArray:(NSArray *)titleArray
//                    viewController:(UIViewController *)vc
//                           confirm:(void(^)(UIAlertAction *action))confirm {
//
//    UIAlertController *sheetAlertController = [UIAlertController alertControllerWithTitle:title message:message
//        preferredStyle:UIAlertControllerStyleActionSheet];
//
//    if (!cancelTitle) cancelTitle = @"取消";
//
//    //取消
//    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:nil];
//    [sheetAlertController addAction:cancelAction];
//
//    if (titleArray.count > 0) {
//        for (NSInteger i = 0; i<titleArray.count; i++) {
//            UIAlertAction  *action = [UIAlertAction actionWithTitle:titleArray[i]
//              style:UIAlertActionStyleDefault
//            handler:confirm];
//            [sheetAlertController addAction:action];
//        }
//    }
//    [vc presentViewController:sheetAlertController animated:YES completion:nil];
//
//    return sheetAlertController;
//}


@end
