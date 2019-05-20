//
//  TiledView.m
//  TiledLayerDemo
//
//  Created by 谢雷 on 2019/5/17.
//  Copyright © 2019 谢雷. All rights reserved.
//

#import "TiledView.h"
#import <QuartzCore/QuartzCore.h>
#import "TiledSetting.h"

@interface TiledLayer : CATiledLayer

@end

@implementation TiledLayer

+ (CFTimeInterval)fadeDuration{
    
    return 0.1;
}

- (CGSize)tileSize{
    
    return TiledSetting.defaultSetting.tileSize;
}

@end

@implementation TiledView

+ layerClass
{
    return [TiledLayer class];
}

+(CGSize)defaultSize{
    return TiledSetting.defaultSetting.tileSize;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
//    if (![[NSThread currentThread] isMainThread]) {
//
//    }
//    dispatch_async(dispatch_get_main_queue(), ^{
        CGSize tileSize = CGSizeZero;
        if (self.wiImageSize.width != 0 && self.wiImageSize.height != 0) {
            tileSize = self.wiImageSize;
        }else{
            tileSize = [[self class] defaultSize];
        }
        
        int firstCol = floorf(CGRectGetMinX(rect) / tileSize.width);
        int lastCol = floorf((CGRectGetMaxX(rect)-1) / tileSize.width);
        int firstRow = floorf(CGRectGetMinY(rect) / tileSize.height);
        int lastRow = floorf((CGRectGetMaxY(rect)-1) / tileSize.height);
        
        for (int row = firstRow; row <= lastRow; row++) {
            for (int col = firstCol; col <= lastCol; col++) {
                UIImage *tile = [self tileAtCol:col row:row];
                
                if (tile)
                {
                    CGRect tileRect = CGRectMake(tileSize.width * col, tileSize.height * row,
                                                 tileSize.width, tileSize.height);
                    
                    tileRect = CGRectIntersection(self.bounds, tileRect);
                    
                    [tile drawInRect:tileRect];
                }
            }
        }
//    });

}

- (UIImage*)tileAtCol:(int)col row:(int)row
{
    NSString *path = [NSString stringWithFormat:@"%@%d_%d", self.fileURLString, col, row];
    return [UIImage imageWithContentsOfFile:path];
}

@end
