//
//  TiledViewController.m
//  TiledLayerDemo
//
//  Created by 谢雷 on 2019/5/17.
//  Copyright © 2019 谢雷. All rights reserved.
//

#import "TiledViewController.h"
#import "TiledView.h"
#import "TiledUtility.h"
#import "TiledSetting.h"
#import <Masonry/Masonry.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface TiledViewController ()

@property (nonatomic, weak) UIScrollView *photoScrollView;

@property (nonatomic, weak) TiledView *tiledView;

@end

@implementation TiledViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"handlePhotoAction" style:UIBarButtonItemStyleDone target:self action:@selector(handlePhotoAction:)];
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIScrollView *photoScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:photoScrollView];
    self.photoScrollView = photoScrollView;
    [self.photoScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_equalTo(0);
        make.width.mas_equalTo(self.view.mas_width);
        make.height.mas_equalTo(self.view.mas_height);
    }];
}

- (void)handlePhotoAction:(id)sender{
    UIImage *largeImage = [UIImage imageNamed:@"china.jpg"];
    
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"china.jpg"];
    
    MBRoundProgressView *hud = [[MBRoundProgressView alloc] init];
    hud.progressTintColor = [UIColor greenColor];
    hud.backgroundTintColor = [UIColor blueColor];
    [self.view addSubview:hud];
    [hud mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    __weak typeof(self) weakSelf = self;
    [TiledUtility saveTilesOfSize:TiledSetting.defaultSetting.tileSize forImage:largeImage fileURLString:filePath progressBlock:^(NSInteger totalImagesCroped, NSInteger totalImagesExpectedToCroped) {
        float progress = ((double)totalImagesCroped/(double)totalImagesExpectedToCroped);
        NSLog(@"progress : %f",progress);
        hud.progress = progress;
    } completion:^{
        [hud setHidden:YES];
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf loadPhotoAction:filePath image:largeImage];
    }];
    
}

- (void)loadPhotoAction:(NSString *)filePath image:(UIImage *)image{
    TiledView *tiledView = [[TiledView alloc] init];
    tiledView.fileURLString = filePath;
    [self.photoScrollView addSubview:tiledView];
    self.tiledView = tiledView;
    [self.tiledView mas_makeConstraints:^(MASConstraintMaker *make) {
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
