//
//  ViewController.m
//  AnimationForAutoLayoutDemo
//
//  Created by user on 15/9/20.
//  Copyright © 2015年 lcg. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *displayView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSLayoutConstraint constraintWithItem:<#(nonnull id)#> attribute:<#(NSLayoutAttribute)#> relatedBy:<#(NSLayoutRelation)#> toItem:<#(nullable id)#> attribute:<#(NSLayoutAttribute)#> multiplier:<#(CGFloat)#> constant:<#(CGFloat)#>]
    //创建displayView
    UIView *displayView = [[UIView alloc] init];
    displayView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:displayView];
    self.displayView = displayView;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //添加约束
    [displayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(100);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(200, 50));
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-50);
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)buttonAction:(UIButton *)button{
    //动画改变
    [self.view layoutIfNeeded];
    [UIView animateWithDuration:1.0 animations:^{
        [self.displayView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(300, 300));
        }];
        [self.view layoutIfNeeded];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
