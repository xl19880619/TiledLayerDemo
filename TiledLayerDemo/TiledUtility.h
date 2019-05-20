//
//  TiledUtility.h
//  TiledLayerDemo
//
//  Created by 谢雷 on 2019/5/17.
//  Copyright © 2019 谢雷. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TiledUtility : NSObject

+ (void)saveTilesOfSize:(CGSize)size
               forImage:(UIImage*)image
          fileURLString:(NSString *)fileURLString
          progressBlock:(void(^)(NSInteger totalImagesCroped, NSInteger totalImagesExpectedToCroped))progessBlock
             completion:(void(^)(void))completion;

@end

NS_ASSUME_NONNULL_END
