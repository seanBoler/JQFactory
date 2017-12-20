//
//  JQFactory.m
//  EnterpriseiPhone
//
//  Created by Mr_Egy on 2017/6/9.
//  Copyright © 2017年 JiaQi. All rights reserved.
//

#import "JQFactory.h"
// View 圆角和加边框
#define BorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


@implementation JQFactory

#pragma mark - make View
+ (UIView *)createViewWithBorderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
{
    return [self createViewWithBorderWidth:borderWidth cornerRadius:0 borderColor:borderColor];
}

+ (UIView *)createViewWithBorderWidth:(CGFloat)borderWidth
                         cornerRadius:(CGFloat)cornerRadius //圆半径
                          borderColor:(UIColor *)borderColor
{
    UIView *view = [[UIView alloc] init];
    
    if (borderColor) {
        view.layer.borderWidth = borderWidth;
        view.layer.borderColor = borderColor.CGColor;
        
        if (cornerRadius > 0)
            {
            view.layer.cornerRadius = cornerRadius;
            }
    }
    
    return view;
}

#pragma mark - make Button
+ (UIButton *)createButtonWithTitle:(NSString *)title
                         titleColor:(UIColor *)titleColor
                      titleFontSize:(CGFloat)fontSize
                             target:(id)target
                             action:(SEL)aSelect
{
    return [self createButtonWithTitle:title titleColor:titleColor titleFontSize:fontSize normalImage:nil hightLigthImage:nil target:target action:aSelect];
}

+ (UIButton *)createButtonWithTitle:(NSString *)title
                         titleColor:(UIColor *)titleColor
                      titleFontSize:(CGFloat)fontSize
                        normalImage:(UIImage *)normalImage
                    hightLigthImage:(UIImage *)hightLightImage
                             target:(id)target
                             action:(SEL)aSelect
{
    UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:titleColor forState:UIControlStateNormal];
        [button setTitleColor:[titleColor colorWithAlphaComponent:0.3] forState:UIControlStateHighlighted];
        [button.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    }
    
    if (normalImage) {
        [button setImage:normalImage forState:UIControlStateNormal];
    }
    
    if (hightLightImage) {
        [button setImage:hightLightImage forState:UIControlStateSelected];
    }
    
    if (target) {
        [button addTarget:target action:aSelect forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;
}


#pragma mark - make Label
+ (UILabel *)createLabelWithColor:(UIColor *)textColor
                         fontSize:(CGFloat)fontSize
                        alignment:(NSTextAlignment)alignment
{
    return [self createLabelWithColor:textColor
                             fontSize:fontSize
                            alignment:alignment
                          borderWidth:0
                          borderColor:nil];
}

+ (UILabel *)createLabelWithColor:(UIColor *)textColor
                         fontSize:(CGFloat)fontSize
                        alignment:(NSTextAlignment)alignment
                      borderWidth:(int)borderWidth
                      borderColor:(UIColor *)borderColor
{
    UILabel *label = [[UILabel alloc] init];
    [label setFont:[UIFont systemFontOfSize:fontSize]];
    [label setTextColor:textColor];
    [label setTextAlignment:alignment];
    
    //    [label setMaxNumberOfLinesToShow:numberOfLines]; //显示行数
    label.layer.borderWidth = borderWidth;              //边框宽度
    label.layer.borderColor = borderColor.CGColor;      //边框颜色,要为CGColor
    return label;
}

+(UITextField *)creatTextFieldWithLeftViewtextColor:(UIColor *)textColor
                                 textFontSize:(CGFloat)fontSize
                                  placeHodler:(NSString *)placeHodler
                                       ifViewRadius:(BOOL)radius
{
    UITextField *textField = [[UITextField alloc] init];
    textField.backgroundColor = [UIColor whiteColor];

    [textField setFont:[UIFont systemFontOfSize:fontSize]];
    [textField setTextColor:textColor];
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, textField.frame.size.height)];
    textField.leftView = leftView;
    [textField setReturnKeyType:UIReturnKeyDone];                   //设置返回键样式  ->完成
    textField.leftViewMode = UITextFieldViewModeAlways;

    textField.textAlignment = NSTextAlignmentLeft;                  //左对齐
    textField.borderStyle = UITextBorderStyleRoundedRect;           //textfield带边框
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;    //设置输入框清除按钮  只在编辑是出现
    NSAttributedString *testTextString = [[NSAttributedString alloc] initWithString:placeHodler attributes:nil];
    [textField setAttributedPlaceholder:testTextString];
    if (radius){
        BorderRadius(textField, 2, 1, RGBACOLOR(218, 218, 218,1));
    }
    //textField.secureTextEntry = YES;  //设置安全密码 输入保护 ********

    return textField;
}

/**
 UITextField  LeftLabelView
 */
+ (UITextField *)creatTextFieldWithLableLefttextColor:(UIColor *)textColor
                                         textFontSize:(CGFloat)fontSize
                                          placeHodler:(NSString *)placeHodler
                                         ifViewRadius:(BOOL)radius
                                       leftLabelTitle:(NSString *)labelTitle
                                       leftLabelColor:(UIColor *)labelColor{
    
    UITextField *textField = [[UITextField alloc] init];
    textField.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *label = [JQFactory createLabelWithColor:labelColor fontSize:fontSize alignment:NSTextAlignmentLeft];
    label.text = labelTitle;
    /**
     设置leftLabel
     */
    CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, textField.frame.size.height)];
    label.frame = CGRectMake(0, 0, size.width,textField.frame.size.height);
    textField.leftView = label;

    [textField setFont:[UIFont systemFontOfSize:fontSize]];
    [textField setTextColor:textColor];
    [textField setReturnKeyType:UIReturnKeyDone];                   //设置返回键样式  ->完成
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.textAlignment = NSTextAlignmentLeft;                  //左对齐
    textField.borderStyle = UITextBorderStyleRoundedRect;           //textfield带边框
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;    //设置输入框清除按钮  只在编辑是出现
    NSAttributedString *testTextString = [[NSAttributedString alloc] initWithString:placeHodler attributes:nil];
    [textField setAttributedPlaceholder:testTextString];
    if (radius){
        BorderRadius(textField, 2, 1, RGBACOLOR(218, 218, 218,1));
    }
    
    return textField;
}

/*
 - (BOOL)textFieldShouldReturn:(UITextField *)textField{
 [textField resignFirstResponder];//主要是[receiver resignFirstResponder]在哪调用就能把receiver对应的键盘往下收
 return YES;
 }
 
 -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
 [_textField resignFirstResponder];
 }
 */







#pragma mark - make textView
+ (UITextView *)createTextViewWithTextColor:(UIColor *)textColor textFontSize:(CGFloat)fontSize editable:(BOOL)editable textAlignment:(NSInteger)textAlignment
{
    UITextView *textView = [[UITextView alloc] init];
    [textView setFont:[UIFont systemFontOfSize:fontSize]];
    //textView.textContainerInset = UIEdgeInsetsMake(20, 20, 20, 20);  //跳转文字与文本框的内边距
    /*
     {
     NSTextAlignmentLeft      = 0,    // 左对齐
     NSTextAlignmentCenter    = 1,    // 居中对齐
     NSTextAlignmentRight     = 2,    // 右对齐
     NSTextAlignmentRight     = 1,
     NSTextAlignmentCenter    = 2,
     NSTextAlignmentJustified = 3,    // 两端对齐
     NSTextAlignmentNatural   = 4,    // 根据现实的文字特性对齐
     }
     */
    textView.textAlignment = textAlignment;         //文字显示方向
    [textView setTextColor:textColor];
    textView.editable = editable;                   //默认YES 是否可以编辑
    return textView;
}

#pragma mark - make imageView
+ (UIImageView *)createImageViewWithImage:(UIImage *)image
{
    return [self createImageViewWithImage:image contentMode:0];
}

+ (UIImageView *)createImageViewWithImage:(UIImage *)n_image contentMode:(UIViewContentMode)contentMode
{
    UIImageView *imageView  = [[UIImageView alloc] initWithImage:n_image];
    imageView.backgroundColor = [UIColor clearColor];
    /*
     *UIViewContentMode{
     UIViewContentModeCenter             居中显示
     UIViewContentModeScaleToFill        填充全部
     UIViewContentModeScaleAspectFit     等比例
     };
     */
    imageView.contentMode = contentMode;
    
    return imageView;
}

#pragma mark - attributionString
+ (NSAttributedString *)createAttributedWithText:(NSString *)text
                                       alignment:(NSTextAlignment)alignment
                                     lineSpacing:(CGFloat)lineSpacing
                                paragraphSpacing:(CGFloat)paragraphSpacing
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = alignment;
    
    if (lineSpacing > 0)
        {
        paragraphStyle.lineSpacing = lineSpacing;
        }
    
    if (paragraphSpacing > 0)
        {
        paragraphStyle.paragraphSpacing = paragraphSpacing;
        }
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:text attributes:@{NSParagraphStyleAttributeName : paragraphStyle}];
    
    return attributedString;
}

#pragma mark - tableView
+ (UITableView *)createTableViewFrame:(CGRect)frame
                      backgroundColor:(UIColor *)groundColor
                                style:(UITableViewStyle)style
                  cellReuseIdentifier:(NSString *)cellIdentifier
                        registerClass:(nullable Class)registerClass{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:frame style:style];
    tableView.backgroundColor = groundColor;
    [tableView registerClass:[registerClass class] forCellReuseIdentifier:cellIdentifier];
    tableView.tableFooterView = [UIView new];
    
    return tableView;
}

#pragma mark - makeNavigationItemr
+ (UIBarButtonItem *)createBackBarButtonItemWithTarget:(id)target
                                                action:(SEL)aSelector
{
    return [self createButtonItemWithTarget:target action:aSelector image:@"Navigation_back"];
}

+ (UIBarButtonItem *)createButtonItemWithTarget:(id)target
                                         action:(SEL)aSelector
                                          title:(NSString *)title
{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleDone target:target action:aSelector];
    barButtonItem.tintColor = RGBWhiteColor;
    return barButtonItem;
}

+ (UIBarButtonItem *)createButtonItemWithTarget:(id)target
                                         action:(SEL)aSelector
                                          image:(NSString *)image
{
    UIImage *selectImage = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:selectImage style:UIBarButtonItemStyleDone target:target action:aSelector];
    return barButtonItem;
}

+ (UIAlertController *)createAlertControllerWithTitle:(NSString *)title message:(NSString *)message alertAction:(NSArray *)alertAction target:(id)target{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    //UIAlertAction *photography = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    //    [self photography];
    //}];
    for (UIAlertAction *cancel in alertAction) {
        [alert addAction:cancel];
    }
    [target presentViewController:alert animated:YES completion:nil];
    return alert;
}


+ (void)alertViewControllerWithTarget:(id)target message:(NSString *)message actionBlock:(void (^)(UIAlertAction * _Nonnull action))actionHander;
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:actionHander]];
    
    [target presentViewController:alert animated:YES completion:nil];
}


+ (void)alerviewwithTarget:(id)target message:(NSString *)message{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [target presentViewController:alert animated:YES completion:nil];
}




/**
 获取当前时间  yyyymmdd
 */
+ (NSString*)getCurrentTimes{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"YYYYMMdd"]; //HELLO8871
    //现在时间,你可以输出来看下是什么格式
    NSDate *datenow = [NSDate date];
    //----------将nsdate按formatter格式转成nsstring
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    NSLog(@"currentTimeString =  %@",currentTimeString);
    return currentTimeString;
    
}

/**
 转码 <name>参数</name>  转换成UTF-8
 */

+ (NSString *)stringWithtag:(NSString *)tag  parameter:(NSString *)parameter{
    NSString *string = [NSString stringWithFormat:@"<%@>%@</%@>",tag,parameter,tag];
    return string;
}

/**
 *  URLEncode
 */
+(NSString *)getUrlStringFromString:(NSString *)urlStr{
    NSString *outputStr = (__bridge NSString *)
    CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                            (__bridge CFStringRef)urlStr,
                                            NULL,
                                            (CFStringRef)@"!*'();:@&=+$,?%#[]<>",
                                            kCFStringEncodingUTF8);
    return outputStr;
}

/**
生成Guid
 */
+ (NSString*)stringWithUUID{
    
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    CFRelease(uuid_ref);
    NSString *firstName = (__bridge NSString *)(uuid_string_ref);
    NSString *uuid = [NSString stringWithString:firstName];
    CFRelease(uuid_string_ref);
    return uuid;
}



//获取当前系统时间的时间戳

#pragma mark - 获取当前时间的 时间戳

+ (NSInteger)getNowTimestamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY/MM/dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[datenow timeIntervalSince1970]] integerValue];

    NSLog(@"设备当前的时间戳:%ld",(long)timeSp); //时间戳的值

    return timeSp;
}


#pragma mark - 将某个时间转化成 时间戳
+ (NSInteger)timeSwitchTimestamp:(NSString *)formatTime{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY/MM/dd hh:mm:ss"];  //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    
     NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    NSLog(@"将某个时间转化成 时间戳&&&&&&&timeSp:%ld",(long)timeSp); //时间戳的值
    return timeSp;
    
}

+ (NSInteger )timeandDate:(NSString *)endDate{
    NSInteger endtime = [self timeSwitchTimestamp:endDate];
    NSInteger now = [self getNowTimestamp];
   
    return (endtime - now);
}



@end
