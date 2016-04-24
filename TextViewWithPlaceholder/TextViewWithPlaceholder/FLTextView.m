//
//  FLTextView.m
//  Quartz2D_DrawLine
//
//  Created by 冯璐 on 16/4/12.
//  Copyright © 2016年 NIck_Von. All rights reserved.
//

#import "FLTextView.h"

@interface FLTextView  ()

@property (nonatomic, strong) UILabel *placeholderLabel; //占位label

@end


@implementation FLTextView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        //初始化placehodlerLabel
        UILabel *placeholderLabel = [[UILabel alloc] init];
        
        placeholderLabel.backgroundColor = [UIColor clearColor];
        
        placeholderLabel.numberOfLines = 0;
        
        [self addSubview:placeholderLabel];
        
        self.placeholderLabel = placeholderLabel; //赋值
        
        self.FLPlaceHolderColor = [UIColor lightGrayColor];
        
        self.font = [UIFont systemFontOfSize:15];
        
        // 添加一个通知中心,监听文字改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
        
    }
    
    return self;
    
}


- (void)textDidChange {
    
    // hasText是一个系统的BOOL属性，如果UITextView输入了文字, hasText就是YES，反之就为NO。
    self.placeholderLabel.hidden = self.hasText;
    
    
}


#pragma mark ----- layoutSubviews 里设置label的frame

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    //坐标 (先任意给定两个值 未考虑适配)
    CGFloat x = 5;
    CGFloat y = 8;

    //宽度 textView 宽度 - 2 * x
    CGFloat width = self.frame.size.width - (2 * x);
    
    //高度 (label 自适应高度)
    CGSize maxSize = CGSizeMake(self.placeholderLabel.frame.size.width, MAXFLOAT);
    
    CGFloat height = [self.FLPlaceholder boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.placeholderLabel.font} context:nil].size.height;
    
    CGRect frame = CGRectMake(x, y, width, height);
    
    self.placeholderLabel.frame = frame;
    
}


- (void)setMyPlaceHolderColor:(UIColor *)myPlaceHolderColor {
    
    _FLPlaceHolderColor = myPlaceHolderColor;
    
    self.placeholderLabel.textColor = myPlaceHolderColor;
    
}



- (void)setMyPlaceholder:(NSString *)myPlaceholder {
    
    _FLPlaceholder = [myPlaceholder copy];
    
    //设置文字
    self.placeholderLabel.text = myPlaceholder;
    
    [self setNeedsLayout]; //重新计算frame
    
    
}

- (void)setFont:(UIFont *)font {
    
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    
    [self setNeedsLayout]; //重新计算frame
    
    
}


#pragma mark ------ 重写 text 及 attributedText setter 控制UILable 显示与否

- (void)setText:(NSString *)text {
    
    [super setText:text];
    
    [self textDidChange];
    
}


- (void)setAttributedText:(NSAttributedString *)attributedText {
    
    [super setAttributedText:attributedText];
    
    [self textDidChange];
    
}


//销毁通知中心
- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:UITextViewTextDidChangeNotification];
    
}


@end
