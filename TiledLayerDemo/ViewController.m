//
//  ViewController.m
//  TiledLayerDemo
//
//  Created by 谢雷 on 2019/5/17.
//  Copyright © 2019 谢雷. All rights reserved.
//

#import "ViewController.h"
#import "NormalViewController.h"
#import "TiledViewController.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *pushNormalButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [pushNormalButton setTitle:@"normal" forState:UIControlStateNormal];
    [pushNormalButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [pushNormalButton addTarget:self action:@selector(pushNormalAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushNormalButton];
    [pushNormalButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
    
    UIButton *pushTiledButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [pushTiledButton setTitle:@"tiled" forState:UIControlStateNormal];
    [pushTiledButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [pushTiledButton addTarget:self action:@selector(pushTiledAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushTiledButton];
    [pushTiledButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(pushNormalButton);
        make.top.mas_equalTo(pushNormalButton.mas_bottom).with.mas_offset(20);
        make.width.mas_equalTo(pushNormalButton.mas_width);
        make.height.mas_equalTo(pushNormalButton.mas_height);
    }];
}

- (void)pushNormalAction{
    [self.navigationController pushViewController:[[NormalViewController alloc] init] animated:YES];
}

- (void)pushTiledAction{
    [self.navigationController pushViewController:[[TiledViewController alloc] init] animated:YES];
}
@end
