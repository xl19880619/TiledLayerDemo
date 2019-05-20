//
//  TiledSetting.m
//  TiledLayerDemo
//
//  Created by 谢雷 on 2019/5/17.
//  Copyright © 2019 谢雷. All rights reserved.
//

#import "TiledSetting.h"

@implementation TiledSetting

+ (instancetype)defaultSetting{
    static TiledSetting *_setting = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _setting = [[TiledSetting alloc] init];
    });
    return _setting;
}

- (instancetype)init{
    if (self = [super init]) {
        self.tileSize = CGSizeMake(80, 80);
    }
    return self;
}

@end
