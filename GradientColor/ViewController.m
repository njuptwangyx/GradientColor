//
//  ViewController.m
//  GradientColor
//
//  Created by 王宇翔 on 2017/5/9.
//  Copyright © 2017年 王宇翔. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Hex.h"

#define CARD_VIEW_WIDTH ([UIScreen mainScreen].bounds.size.width * 0.85)
#define CARD_VIEW_HEIGHT (CARD_VIEW_WIDTH * 0.5)

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *colors;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.colors = @[@"0xfce38a", @"0xf38181",
                    @"0xf54ea2", @"0xff7676",
                    @"0x17ead9", @"0x6078ea",
                    @"0x622774", @"0xc53364",
                    @"0x7117ea", @"0xea6060",
                    @"0x42e695", @"0x3bb2b8",
                    @"0xf02fc2", @"0x6094ea",
                    @"0x65799b", @"0x5e2563",
                    @"0x184e68", @"0x57ca85",
                    @"0x5b247a", @"0x1bcedf",
                    @"0x303395", @"0x27f0f0",
                    @"0xd20b54", @"0xffb849",
                    @"0x05974a", @"0xf2e51e",
                    @"0x61258a", @"0xfd0f77",
                    @"0xeb121a", @"0xfaeb18",
                    @"0x04a5c1", @"0xf9f981",
                    @"0xcf396f", @"0xf7e28b",
                    @"0xf48731", @"0xd8e015",
                    @"0x2d266f", @"0x7c2289",
                    @"0x009900", @"0xffff92",
                    @"0xab64f6", @"0x61dbf7",
                    @"0x7a7a7a", @"0xe3e0e0",
                    @"0x00f298", @"0x07f7f7",
                    @"0x846ef4", @"0xf17674",
                    @"0xd481ff", @"0x05f1e1",
                    @"0xed4443", @"0xeabc85",
                    @"0x421057", @"0xf45509",
                    @"0x90218c", @"0x009b90",
                    @"0xee20d6", @"0x0a2fb6",
                    @"0xf6072f", @"0xf200a1",
                    @"0xf0da4b", @"0xff005e",
                    @"0x6ce8fd", @"0x0d015b",
                    ];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.colors.count/2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CARD_VIEW_HEIGHT * 1.147;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = [NSString stringWithFormat:@"cell%d", (int)indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        CGFloat x = (self.view.frame.size.width - CARD_VIEW_WIDTH)/2;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x, 0, CARD_VIEW_WIDTH, CARD_VIEW_HEIGHT)];
        view.layer.cornerRadius = 10;
        view.layer.masksToBounds = YES;
        [cell.contentView addSubview:view];
        
        //渐变层
        UIColor *color1 = [UIColor colorWithHexString:self.colors[indexPath.row]];
        UIColor *color2 = [UIColor colorWithHexString:self.colors[indexPath.row + 1]];
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.colors = @[(__bridge id)color1.CGColor, (__bridge id)color2.CGColor];
        gradientLayer.startPoint = CGPointMake(0, 1);
        gradientLayer.endPoint = CGPointMake(1, 0);
        gradientLayer.frame = view.bounds;
        [view.layer addSublayer:gradientLayer];
        
        //颜色值
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, view.frame.size.height - 20 - 10, 100, 20)];
        label1.text = [self.colors[indexPath.row] uppercaseString];
        label1.textColor = [UIColor whiteColor];
        [view addSubview:label1];
        
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(view.frame.size.width - 100 - 10, 10, 100, 20)];
        label2.text = [self.colors[indexPath.row + 1] uppercaseString];
        label2.textColor = [UIColor whiteColor];
        label2.textAlignment = NSTextAlignmentRight;
        [view addSubview:label2];
    }
    return cell;
}

@end
