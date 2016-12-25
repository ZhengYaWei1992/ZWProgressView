//
//  ZWProgressView.m
//  ZWProgressView
//
//  Created by 郑亚伟 on 2016/12/25.
//  Copyright © 2016年 郑亚伟. All rights reserved.
//

#import "ZWProgressView.h"

@interface ZWProgressView ()
@property(nonatomic,strong)UILabel *textLabel;

@end

@implementation ZWProgressView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self addSubview:self.textLabel];
    }
    return self;
}

- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    self.textLabel.text = [NSString stringWithFormat:@"%.2f%%",progress * 100];
    
    //手动调用这个方法，系统是不会生成和View相关联的上下文。
    //只有系统调用drawRect方法时，才会生成和view相关联的上下文
    [self drawRect:self.bounds];
    
    //只有系统调用drawRect方法时，才会生成和view相关联的上下文
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    //画弧
    CGPoint center = CGPointMake(rect.size.width/2, rect.size.height/2);
    CGFloat radius = rect.size.width * 0.5 - 10;
    CGFloat startA = -M_PI_2 ;
    CGFloat endA = -M_PI_2 + self.progress * M_PI * 2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    [[UIColor greenColor] set];
    path.lineWidth = 5;
    [path stroke];
}

- (UILabel *)textLabel{
    if (_textLabel == nil) {
        _textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.text = self.textLabel.text = @"0.00%";
        _textLabel.center = self.center;
    }
    return _textLabel;
}



@end
