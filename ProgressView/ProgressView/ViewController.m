//
//  ViewController.m
//  ProgressView
//
//  Created by 郑亚伟 on 2016/12/25.
//  Copyright © 2016年 郑亚伟. All rights reserved.
//

#import "ViewController.h"
#import "ZWProgressView.h"
@interface ViewController ()
@property(nonatomic,strong)UISlider *slider;
@property(nonatomic,strong)ZWProgressView *zwProgressView;
@property (nonatomic,strong)UILabel *textLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.zwProgressView];
    [self.view addSubview:self.slider];
}

- (ZWProgressView *)zwProgressView{
    if (_zwProgressView == nil) {
        _zwProgressView = [[ZWProgressView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        _zwProgressView.center = self.view.center;
        [_zwProgressView addSubview:self.textLabel];
        _zwProgressView.backgroundColor = [UIColor lightGrayColor];
    }
    return _zwProgressView;
}



- (UISlider *)slider{
    if (_slider == nil) {
        _slider = [[UISlider alloc]initWithFrame:CGRectMake(self.view.frame.size.width /2 - 100, CGRectGetMaxY(_zwProgressView.frame) + 20, 200, 50)];
        [_slider addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _slider;
}

- (void)valueChange:(UISlider *)sender {
    NSLog(@"%f",sender.value);
    //两个%代表一个%
    self.zwProgressView.progress = sender.value;
}



@end
