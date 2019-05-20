//
//  TiledSetting.h
//  TiledLayerDemo
//
//  Created by 谢雷 on 2019/5/17.
//  Copyright © 2019 谢雷. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TiledSetting : NSObject

+ (instancetype)defaultSetting;

@property (nonatomic) CGSize tileSize;

@end

NS_ASSUME_NONNULL_END
