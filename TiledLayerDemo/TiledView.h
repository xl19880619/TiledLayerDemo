//
//  TiledView.h
//  TiledLayerDemo
//
//  Created by 谢雷 on 2019/5/17.
//  Copyright © 2019 谢雷. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TiledView : UIView

@property (nonatomic, copy) NSString *fileURLString;

@property (nonatomic)       CGSize    wiImageSize;

- (UIImage*)tileAtCol:(int)col row:(int)row;

+ (CGSize)defaultSize;

@end

NS_ASSUME_NONNULL_END
