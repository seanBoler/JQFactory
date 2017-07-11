//
//  ViewController.m
//  testApplication
//
//  Created by tlkj on 17/6/29.
//  Copyright © 2017年 zhangjiaqi. All rights reserved.
//

#import "ViewController.h"
#import "JQFactory.h"


@interface ViewController ()<UITextFieldDelegate,UITextViewDelegate>

@property (nonatomic,strong)UIView *views1;
@property (nonatomic,strong)UIButton *button1;//放大后缩小 改变颜色
@property (nonatomic,strong)UIButton *button2;//放大 不改变颜色
@property (nonatomic,strong)UIButton *button3;
@property (nonatomic,strong)UIButton *button4;
@property (nonatomic,strong)UILabel *label;

@property (nonatomic,strong)UITextField *textField; //输入框

@property (nonatomic,strong)UITextView *textView;   //文本框


@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _views1  = [[JQFactory class]createViewWithBorderWidth:2.0 cornerRadius:10.0 borderColor:[UIColor grayColor]];
    _views1.frame  = CGRectMake(200, 400, 100, 100);
    _views1.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.views1];
    
    
    [self initWithButton:_button1 Titile:@"放大后缩小"   tag:1 fontSize:14 x:0 y:100 w:80 h:30];
    [self initWithButton:_button2 Titile:@"放大"        tag:2 fontSize:14 x:100 y:100 w:80 h:30];
    [self initWithButton:_button3 Titile:@"放大透明化"   tag:3 fontSize:14 x:200 y:100 w:80 h:30];
    [self initWithButton:_button4 Titile:@"还原所有按钮"  tag:4 fontSize:14 x:100 y:300 w:120 h:30];
    
    //textfield
    _textField = [JQFactory createTextFieldWithtextColor:[UIColor greenColor] textFontSize:16 placeHodler:@"我是文本框" returnKeyType:UIReturnKeyDefault];
    _textField.frame = CGRectMake(120, 200, 160, 34);
    self.view.userInteractionEnabled = YES;
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
    
    _label = [JQFactory createLabelWithColor:[UIColor blackColor] fontSize:14.0f alignment:NSTextAlignmentCenter numberOfLines:1];
    _label.frame = CGRectMake(12, 200, 80, 40);
    _label.backgroundColor = [UIColor whiteColor];
    _label.text = @"I'm superme";
    [self.view addSubview:self.label];
    
    
    UILabel *lable1 = [JQFactory createLabelWithColor:[UIColor blackColor] fontSize:16.0f alignment:NSTextAlignmentCenter numberOfLines:1 borderWidth:1 borderColor:[UIColor grayColor]];
    lable1.frame = CGRectMake(12, 260, 80, 40);
    lable1.text = @"super girl";
    [self.view addSubview:lable1];
    
    _textView = [JQFactory createTextViewWithTextColor:[UIColor blackColor] textFontSize:16.0f editable:YES textAlignment:0];
    _textView.text = [NSString stringWithFormat:@"typedef NS_ENUM(NSInteger, NSTextAlignment) { \n  NSTextAlignmentLeft      = 0,    // 左对齐 #if TARGET_OS_IPHONE \n  NSTextAlignmentCenter    = 1,  \n  // 居中对齐 NSTextAlignmentRight     = 2,    // 右对齐 \n #else /* !TARGET_OS_IPHONE */ NSTextAlignmentRight     = 1, \nNSTextAlignmentCenter    = 2,  \n #endif NSTextAlignmentJustified = 3,    // 两端对齐 NSTextAlignmentNatural   = 4,    // 根据现实的文字特性对齐 \n } NS_ENUM_AVAILABLE_IOS(6_0);"];
    _textView.frame = CGRectMake(20, 360, 160, 200);
    _textView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textView];
}

- (void)initWithButton:(UIButton *)btn
                Titile:(NSString *)title
                   tag:(NSInteger)tag
              fontSize:(float)fontSzie
                     x:(float)x
                     y:(float)y
                     w:(float)w
                     h:(float)h{
    
    btn = [JQFactory createButtonWithTitle:title titleColor:[UIColor blackColor] titleFontSize:fontSzie target:self action:@selector(action:)];
    btn.frame = CGRectMake(x, y, w, h);
    btn.backgroundColor = [UIColor yellowColor];
    btn.tag = tag;
    [self.view addSubview:btn];
}


- (void)action:(UIButton *)btn{
    [_textField resignFirstResponder];
    [_textView resignFirstResponder];

    switch (btn.tag) {
        case 1:
            [self animateViewX:btn];//开始动画
            break;
            
        case 2:
            [self animateViewD:btn];//开始动画
            
            break;
        case 3:
            [self animateViewA:btn];//开始动画
            
            break;
        case 4:
            [self animateViewH:btn];//还原所有按钮
            
            break;
        default:
            break;
    }
}

- (void)animateViewD:(UIButton *)btn{
    [UIView animateWithDuration:0.5 animations:^{
        btn.backgroundColor = [UIColor redColor];
        float y = 100;
        btn.frame = CGRectMake(100, y, 90, 40);
    }];
}

- (void)animateViewX:(UIButton *)btn{
    
    float y = 100;
    
    [UIView animateWithDuration:1 animations:^{ //执行的动画
        btn.backgroundColor = [UIColor clearColor];
        btn.frame = CGRectMake(0, y, 90, 50);
    } completion:^(BOOL finished) {             //动画执行完毕后的操作
        [UIView animateWithDuration:0.5 animations:^{
            btn.backgroundColor = [UIColor grayColor];
            btn.frame = CGRectMake(0, y-10, 80, 30);
        }];
    }];
}

- (void)animateViewA:(UIButton *)btn{
    float y = 100;
    [UIView animateWithDuration:0.5 animations:^{
        btn.backgroundColor = [UIColor colorWithRed:241 green:31 blue:120 alpha:0.4];
        btn.frame = CGRectMake(200, y, 90, 40);
        
    }];
}

- (void)animateViewH:(UIButton *)btn{
    [UIView animateWithDuration:0.5 animations:^{
        _views1.backgroundColor = [UIColor cyanColor];
        
        btn.frame = CGRectMake(200, 300, 160, 40);
        [btn setBackgroundColor:[UIColor cyanColor]];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -TextField  DELEGATE  
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];//主要是[receiver resignFirstResponder]在哪调用就能把receiver对应的键盘往下收
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_textField resignFirstResponder];
    [_textView resignFirstResponder];
}


#pragma mark -  textViewDELEGATE
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    [textView resignFirstResponder];
    return YES;
}


-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    [textView resignFirstResponder];
    return YES;
}

@end
