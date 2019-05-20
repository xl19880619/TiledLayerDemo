//
//  NormalViewController.m
//  TiledLayerDemo
//
//  Created by 谢雷 on 2019/5/17.
//  Copyright © 2019 谢雷. All rights reserved.
//

#import "NormalViewController.h"
#import <Masonry/Masonry.h>

@interface NormalViewController ()

@property (nonatomic, weak) UIScrollView *photoScrollView;

@property (nonatomic, weak) UIImageView *imageView;
@end

@implementation NormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"handlePhotoAction" style:UIBarButtonItemStyleDone target:self action:@selector(handlePhotoAction:)];
    self.view.backgroundColor = UIColor.blackColor;
    
    UIView *centerView = [[UIView alloc] init];
    centerView.backgroundColor = UIColor.redColor;
    [self.view addSubview:centerView];
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"customerLeft"]];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(centerView.mas_left);
        make.centerY.mas_equalTo(centerView);
        make.size.mas_equalTo(CGSizeMake(30, 55));
    }];
    
//    UIScrollView *photoScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:photoScrollView];
//    self.photoScrollView = photoScrollView;
//    [self.photoScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.and.top.mas_equalTo(0);
//        make.width.mas_equalTo(self.view.mas_width);
//        make.height.mas_equalTo(self.view.mas_height);
//    }];
}

- (void)handlePhotoAction:(id)sender{
    
    UIImage *image = [UIImage imageNamed:@"china.jpg"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.photoScrollView addSubview:imageView];
    self.imageView = imageView;
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_equalTo(0);
        make.size.mas_equalTo(image.size);
    }];
    self.photoScrollView.contentSize = image.size;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
