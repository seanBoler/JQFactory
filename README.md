# JQFactory
- 初始化创建控件
- 控件常用属性 
- 适用控件 （UIView UILabel UIButton UIBarButtonItem UIAlertController UITextFeild UITextView UITableView UIImageView）


## 不带边框view

      + (UIView *)createViewWithBorderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor;
       + (UIView *)createViewWithBorderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
      {
       return [self createViewWithBorderWidth:borderWidth cornerRadius:0 borderColor:borderColor];
      }
## 带边框view
 
      + (UIView *)createViewWithBorderWidth:(CGFloat)borderWidth
                         cornerRadius:(CGFloat)cornerRadius
                          borderColor:(UIColor *)borderColor;
                          
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

## 文字button
        
        + (UIButton *)createButtonWithTitle:(NSString *)title
                         titleColor:(UIColor *)titleColor
                      titleFontSize:(CGFloat)fontSize
                             target:(id)target
                             action:(SEL)aSelect ;
                             
                             + (UIButton *)createButtonWithTitle:(NSString *)title
                         titleColor:(UIColor *)titleColor
                      titleFontSize:(CGFloat)fontSize
                             target:(id)target
                             action:(SEL)aSelect
        {
            return [self createButtonWithTitle:title titleColor:titleColor titleFontSize:fontSize normalImage:nil         hightLigthImage:nil target:target action:aSelect];
            }
            
### 图片button

      + (UIButton *)createButtonWithTitle:(NSString *)title
                         titleColor:(UIColor *)titleColor
                      titleFontSize:(CGFloat)fontSize
                        normalImage:(UIImage *)normalImage
                    hightLigthImage:(UIImage *)hightLightImage
                             target:(id)target
                             action:(SEL)aSelect ;



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


## 不带边框
  
    + (UILabel *)createLabelWithColor:(UIColor *)textColor
                         fontSize:(CGFloat)fontSize
                        alignment:(NSTextAlignment)alignment
                        
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

## 带边框

    + (UILabel *)createLabelWithColor:(UIColor *)textColor
                         fontSize:(CGFloat)fontSize
                        alignment:(NSTextAlignment)alignment
                      borderWidth:(int)borderWidth
                      borderColor:(UIColor *)borderColor;
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
      //[label setMaxNumberOfLinesToShow:numberOfLines]; //显示行数
        label.layer.borderWidth = borderWidth;              //边框宽度
        label.layer.borderColor = borderColor.CGColor;      //边框颜色,要为CGColor
     return label;
    }
    
    
## 输入框

    + (UITextField *)createTextFieldWithtextColor:(UIColor *)textColor
                                 textFontSize:(CGFloat)fontSize
                                  placeHodler:(NSString *)placeHodler
                                returnKeyType:(UIReturnKeyType)returnKeyType;
              
    + (UITextField *)createTextFieldWithtextColor:(UIColor *)textColor
                                 textFontSize:(CGFloat)fontSize
                                  placeHodler:(NSString *)placeHodler
                                returnKeyType:(UIReturnKeyType)returnKeyType
    {
          UITextField *textField = [[UITextField alloc] init];
          [textField setFont:[UIFont systemFontOfSize:fontSize]];
          [textField setTextColor:textColor];
          [textField setPlaceholder:placeHodler];
          [textField setReturnKeyType:returnKeyType];             //设置返回键样式
      //  UIReturnKeyDefault
          textField.textAlignment = NSTextAlignmentLeft;          //左对齐
          textField.borderStyle = UITextBorderStyleRoundedRect;   //textfield带边框
          textField.clearButtonMode = UITextFieldViewModeWhileEditing;  //设置输入框清除按钮  只在编辑是出现
      //  textField.secureTextEntry = YES;  //设置安全密码 输入保护 ********
      return textField;
    }

## textView
    
    + (UITextView *)createTextViewWithTextColor:(UIColor *)textColor
                               textFontSize:(CGFloat)fontSize
                                   editable:(BOOL)editable
                              textAlignment:(NSInteger)textAlignment;
 
    
    + (UITextView *)createTextViewWithTextColor:(UIColor *)textColor textFontSize:(CGFloat)fontSize editable:(BOOL)editable textAlignment:(NSInteger)textAlignment
    {
         UITextView *textView = [[UITextView alloc] init];
         [textView setFont:[UIFont systemFontOfSize:fontSize]];
     //  textView.textContainerInset = UIEdgeInsetsMake(20, 20, 20, 20);  //跳转文字与文本框的内边距
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
 
    
## imageView 图片

    + (UIImageView *)createImageViewWithImage:(UIImage *)image;
    + (UIImageView *)createImageViewWithImage:(UIImage *)image
    {
      return [self createImageViewWithImage:image contentMode:0];
    }

## imageView contentMode

    + (UIImageView *)createImageViewWithImage:(UIImage *)n_image
                              contentMode:(UIViewContentMode)contentMode;   
    
    + (UIImageView *)createImageViewWithImage:(UIImage *)n_image contentMode:(UIViewContentMode)contentMode
    {
        UIImageView *imageView  = [[UIImageView alloc] initWithImage:n_image];
        imageView.backgroundColor = [UIColor whiteColor];
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
    
   
## tableView clsaa and style

    + (UITableView *)createTableViewFrame:(CGRect)frame
                      backgroundColor:(UIColor *)groundColor
                                style:(UITableViewStyle)style
                  cellReuseIdentifier:(NSString *)cellIdentifier
                        registerClass:(nullable Class)registerClass;  

    + (UITableView *)createTableViewFrame:(CGRect)frame
                      backgroundColor:(UIColor *)groundColor
                                style:(UITableViewStyle)style
                  cellReuseIdentifier:(NSString *)cellIdentifier
                        registerClass:(nullable Class)registerClass{
    
         UITableView *tableView = [[UITableView alloc]initWithFrame:frame style:style];
         tableView.backgroundColor = groundColor;
         [tableView registerClass:[registerClass class] forCellReuseIdentifier:cellIdentifier];
    //   tableView.tableFooterView = [UIView new];  
      return tableView;
    }  
      
      
      
      
      
# JQFactory
