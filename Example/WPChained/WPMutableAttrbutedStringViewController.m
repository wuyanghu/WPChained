//
//  WPMutableAttrbutedStringViewController.m
//  WPChained_Example
//
//  Created by wupeng on 2020/1/11.
//  Copyright © 2020 823105162@qq.com. All rights reserved.
//

#import "WPMutableAttrbutedStringViewController.h"
#import "WPChainedHeader.h"
#import "WPHeader.h"

@interface WPMutableAttrbutedStringViewController ()

@end

@implementation WPMutableAttrbutedStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:@"优点：\n1.相同model仅分配一次内存\n2.更新时直接刷新，不用查找替换再刷新。实际节省的内存不到1MB 1KB = 1024B，一个汉字=3B 1024/3 = 341个字 1MB = 341*1024=34.9万字，但是可以减少内存的分配与释放的时间。 对于大内存优势明显：多个用户相同主题包仅下载一次,https://www.baidu.com"];
    [attriStr wp_makeAttributed:^(WPMutableAttributedStringMaker * _Nullable make) {
        make.textColor([UIColor redColor],NSMakeRange(0, 3));
        make.textFont(18,NSMakeRange(3, attriStr.string.length-3));
        make.insertImage(@"navi_search",CGRectMake(0, 0, 10, 11),5);
    }];
    
    NSString * text = attriStr.string;
    //可以分开设置
    [attriStr wp_makeAttributed:^(WPMutableAttributedStringMaker * _Nullable make) {
        make.link(@"https://www.baidu.com",[text rangeOfString:@"https://www.baidu.com"]);
    }];
    
    CGSize size = [attriStr boundingRectWithSize:CGSizeMake(ScreenWidth-16*2, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    UILabel * label = [UILabel.createLabel wp_makeProperty:^(WPLabelChainedMaker * _Nullable make) {
        make.frame(CGRectMake(16, 88, ScreenWidth-16*2, size.height+10));
    }];
    label.numberOfLines = 0;
    label.attributedText = attriStr;
    [self.view addSubview:label];
}

@end
