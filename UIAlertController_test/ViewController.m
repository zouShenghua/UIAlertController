//
//  ViewController.m
//  UIAlertController_test
//
//  Created by 维奕 on 2017/9/21.
//  Copyright © 2017年 维奕. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertController+ZSHAlertController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *TabV;
@property(strong,nonatomic)UIAlertController *alert;
@property(strong,nonatomic)NSArray *arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.arr=@[@"提示框、确定按钮",@"提示框、确定、取消",@"输入框",@"选择"];
    [self.view addSubview:self.TabV];
    
    
    
    
    
    
}




#pragma mark 表格创建
-(UITableView *)TabV{
    if (_TabV==nil) {
        _TabV=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        _TabV.delegate=self;
        _TabV.dataSource=self;
    }
    return _TabV;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.000001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView=[UIView new];
    headView.backgroundColor=[UIColor grayColor];
    return headView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld---%ld",(long)indexPath.section,(long)indexPath.row);
    
    switch (indexPath.row) {
        case 0:{
            self.alert=[UIAlertController alertTitle:@"提示" mesasge:@"提示标题" confirmHandler:^(UIAlertAction *confirmAction) {
                
            } showViewController:self];
        }break;
           case 1:{
               self.alert=[UIAlertController alertTitle:@"提示" mesasge:@"提示内容" confirmHandler:^(UIAlertAction *confirmAction) {
                   
               } cancelHandler:^(UIAlertAction *cancleAction) {
                   
               } showViewController:self];
         }break;
            case 2:{
                self.alert=[UIAlertController alertTitle:@"" mesasge:@"请输入" addTextField:^(UITextField *textFild) {
                    textFild.placeholder=@"请输入昵称";
                } confirmHandler:^(UIAlertAction *confirmAction) {
                            NSArray * textfields = self.alert.textFields;
                            UITextField * namefield = textfields[0];
                            NSLog(@"%@",namefield.text);
                } cancelHandler:^(UIAlertAction *cancleAction) {
                    
                } showViewController:self];
                
            }break;
            case 3:{
                    NSArray *arr=@[@"选择一",@"选择二"];
                    self.alert=[UIAlertController actionSheettWithTitle:@"提示" message:@"提示" actionTitles:arr actionHandler:^(UIAlertAction *action, NSUInteger index) {
                        NSLog(@"%lu",(unsigned long)index);
                    } showViewController:self];
            }break;
        default:
            break;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellStr=@"cell";
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellStr];
    cell.textLabel.text=self.arr[indexPath.row];
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
