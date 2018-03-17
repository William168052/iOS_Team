//
//  ViewController.m
//  Calculator
//
//  Created by William on 2017/12/18.
//  Copyright © 2017年 William. All rights reserved.
//

#import "ViewController.h"
#import "NumberOperation.h"
#import "Stack.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *buttonView;
@property (nonatomic ,strong) NSArray *btnArray;
//显示结果的Label
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
//AC
@property (weak, nonatomic) IBOutlet UIButton *ACButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置状态栏颜色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //设置Label字数超出自动缩小
    self.displayLabel.adjustsFontSizeToFitWidth = YES;
    //加载button数据
    [self loadData];
}
- (IBAction)ACTouched:(UIButton *)sender {
    [self.displayLabel setText:@"0"];
    [self.ACButton setTitle:@"AC" forState:UIControlStateNormal];
}
- (IBAction)buttonTouched:(UIButton *)sender {
        NSString *s = self.displayLabel.text;
        if([s isEqualToString:@"0"]){
            s = @"";
        }
        NSString *s2 = sender.titleLabel.text;
        self.displayLabel.text = [NSString stringWithFormat:@"%@%@",s,s2];
        [self.ACButton setTitle:@"C" forState:UIControlStateNormal];
    
}
//改变正负号的按钮
- (IBAction)changeSign:(UIButton *)sender {
    NSString *s = self.displayLabel.text;
    double num;
    @try{
        num = s.doubleValue;
    }
    @catch(NSException *exception){
        NSLog(@"Exception named %@ accured , reason is : %@",exception.name,exception.reason);
        num = 0.0;
    }
    num = -num;
    //%g格式符不输出小数点后无意义的零
    self.displayLabel.text = [NSString stringWithFormat:@"%g",num];
}
//“=”按钮
- (IBAction)resultNumber:(UIButton *)sender {
    NSString *s = self.displayLabel.text;
    NSNumber *result = [NumberOperation calculateWithExpression:s];
    double res = result.doubleValue;
    self.displayLabel.text = [NSString stringWithFormat:@"%g",res];
}
//懒加载btnArray
- (NSArray *)btnArray{
    if(_btnArray == nil){
        NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"AC",@"+/-",@"%",@"÷",@"7",@"8",@"9",@"×",@"4",@"5",@"6",@"-",@"1",@"2",@"3",@"+",@"0",@".",@"=",nil];
        _btnArray = [NSArray arrayWithArray:arr];
    }
    return _btnArray;
}
//加载button数据
- (void)loadData{
    NSArray *arr = self.buttonView.subviews;
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = obj;
        NSString *title = [self.btnArray objectAtIndex:idx];
        [btn setTitle:title forState:UIControlStateNormal];
        //设置边框颜色
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
        CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){0,0,0,0.5});
        [btn.layer setBorderColor:color];
        //设置边框宽度
        [btn.layer setBorderWidth:0.5];
        //重新赋值回去
        obj = btn;
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
