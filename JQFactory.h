//
//  JQFactory.h
//  EnterpriseiPhone
//
//  Created by Mr_Egy on 2017/6/9.
//  Copyright © 2017年 JiaQi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JQFactory : NSObject

#pragma mark - make View
///不带边框
+ (UIView *)createViewWithBorderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor;
///带边框
+ (UIView *)createViewWithBorderWidth:(CGFloat)borderWidth
                         cornerRadius:(CGFloat)cornerRadius
                          borderColor:(UIColor *)borderColor;

#pragma mark - make Button
///文字button
+ (UIButton *)createButtonWithTitle:(NSString *)title
                         titleColor:(UIColor *)titleColor
                      titleFontSize:(CGFloat)fontSize
                             target:(id)target
                             action:(SEL)aSelect ;

///图片button
+ (UIButton *)createButtonWithTitle:(NSString *)title
                         titleColor:(UIColor *)titleColor
                      titleFontSize:(CGFloat)fontSize
                        normalImage:(UIImage *)normalImage
                    hightLigthImage:(UIImage *)hightLightImage
                             target:(id)target
                             action:(SEL)aSelect ;

#pragma mark - make Label
///不带边框
+ (UILabel *)createLabelWithColor:(UIColor *)textColor
                         fontSize:(CGFloat)fontSize
                        alignment:(NSTextAlignment)alignment
                    numberOfLines:(int)numberOfLines;
///带边框
+ (UILabel *)createLabelWithColor:(UIColor *)textColor
                         fontSize:(CGFloat)fontSize
                        alignment:(NSTextAlignment)alignment
                    numberOfLines:(int)numberOfLines
                      borderWidth:(int)borderWidth
                      borderColor:(UIColor *)borderColor;


#pragma mark - make textField
///输入框
+ (UITextField *)createTextFieldWithtextColor:(UIColor *)textColor
                                 textFontSize:(CGFloat)fontSize
                                  placeHodler:(NSString *)placeHodler
                                returnKeyType:(UIReturnKeyType)returnKeyType;

#pragma mark - make textView
+ (UITextView *)createTextViewWithTextColor:(UIColor *)textColor
                               textFontSize:(CGFloat)fontSize
                                   editable:(BOOL)editable
                              textAlignment:(NSInteger)textAlignment;


#pragma mark - make imageView
///imageView 图片
+ (UIImageView *)createImageViewWithImage:(UIImage *)image;

///imageView contentMode
+ (UIImageView *)createImageViewWithImage:(UIImage *)n_image
                              contentMode:(UIViewContentMode)contentMode;

#pragma mark - attributionString
+ (NSAttributedString *)createAttributedWithText:(NSString *)text
                                       alignment:(NSTextAlignment)alignment
                                     lineSpacing:(CGFloat)lineSpacing
                                paragraphSpacing:(CGFloat)paragraphSpacing;

#pragma mark - make UIBarButtonItem
+ (UIBarButtonItem *)createBackBarButtonItemWithTarget:(id)target
                                                action:(SEL)aSelector;
///barButtonItem  Title action
+ (UIBarButtonItem *)createButtonItemWithTarget:(id)target
                                             action:(SEL)aSelector
                                              title:(NSString *)title;
///barButtonItem  image action
+ (UIBarButtonItem *)createButtonItemWithTarget:(id)target
                                             action:(SEL)aSelector
                                              image:(UIImage *)image;

#pragma mark - tableView
///tableView clsaa and style
+ (UITableView *)createTableViewFrame:(CGRect)frame
                      backgroundColor:(UIColor *)groundColor
                                style:(UITableViewStyle)style
                  cellReuseIdentifier:(NSString *)cellIdentifier
                        registerClass:(nullable Class)registerClass;

@end
