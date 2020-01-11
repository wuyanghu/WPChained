//
//  WPViewController.m
//  WPChained
//
//  Created by 823105162@qq.com on 01/11/2020.
//  Copyright (c) 2020 823105162@qq.com. All rights reserved.
//

#import "WPViewController.h"
#import "UILabel+WPChained.h"
#import "UIButton+WPChained.h"
#import "UINavigationItem+WPAddBarButtonItem.h"
#import "NSMutableAttributedString+WPAddAttributed.h"
#import "WPMutableAttrbutedStringViewController.h"
#import "WPHeader.h"

@interface WPViewController ()

@end

@implementation WPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"链式";
    
    [self addChainedNaviItem];
    [self addChainedLabel];
    [self addChainedButton];
}

- (void)addChainedNaviItem{
    __weak __typeof(self) weakSelf = self;
    [self.navigationItem wp_makeNaviItem:^(WPNavigationChainedMaker * _Nullable make) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;

        make.addLeftItemTitle(@"解析",^(UIButton * button) {
            NSLog(@"解析");
        });
        
        make.addLeftItemImage([UIImage imageNamed:@"navi_search"],^(UIButton *button) {
            NSLog(@"我是图片");
        });
        
        make.addRightItemTitle(@"调用",^(UIButton * button) {
            NSLog(@"调用js方法");
        });
    }];
}

- (void)addChainedLabel{
    UILabel * label =
    [UILabel.createLabel wp_makeProperty:^(WPLabelChainedMaker * _Nullable make) {
        make.frame(CGRectMake(10, 100, 100, 30))
        .text(@"链式lable")
        .textColor([UIColor grayColor])
        .font([UIFont systemFontOfSize:22])
        .bgColor([UIColor redColor]);
    }];
    
    [self.view addSubview:label];
    
    UILabel * label2 =
    [UILabel.createLabel wp_makeProperty:^(WPLabelChainedMaker * _Nullable make) {
        make.frame(CGRectMake(10, 150, 100, 30))
        .textColor([UIColor grayColor])
        .bgColor([UIColor blueColor]);
    }];
    [self.view addSubview:label2];

}

- (void)addChainedButton{
    __weak typeof(self) weakSelf = self;
    UIButton * button =
    [UIButton.createButton wp_makeProperty:^(WPButtonChainedMaker * _Nullable make) {
        
        make.frame(CGRectMake(10, 200, 100, 30));
        make.title(@"富文本链式",UIControlStateNormal);
        make.bgColor([UIColor redColor]);
        make.addTarget(
                       ^(UIButton * button){
                           [weakSelf buttonAction:button];
                       }
                       );
    }];
    [self.view addSubview:button];
    
    UIButton * button2 =
    [UIButton.createButton wp_makeProperty:^(WPButtonChainedMaker * _Nullable make) {
        make.frame(CGRectMake(10, 250, 100, 30))
        .title(@"button2",UIControlStateNormal)
        .bgColor([UIColor redColor])
        .addTarget(^(UIButton * button){
            [weakSelf buttonAction2:button];
        });
    }];
    
    [self.view addSubview:button2];
}

- (void)buttonAction:(UIButton *)button{
    NSLog(@"这是富文本链式");
    [self pushAttributedVC];
}

- (void)buttonAction2:(UIButton *)button{
    NSLog(@"这是button2");
}

- (void)pushAttributedVC{
    WPMutableAttrbutedStringViewController * attributedVC = [[WPMutableAttrbutedStringViewController alloc] init];
    [self.navigationController pushViewController:attributedVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
