//
//  TiledUtility.m
//  TiledLayerDemo
//
//  Created by 谢雷 on 2019/5/17.
//  Copyright © 2019 谢雷. All rights reserved.
//

#import "TiledUtility.h"

@implementation TiledUtility

+ (void)saveTilesOfSize:(CGSize)size
               forImage:(UIImage*)image
          fileURLString:(NSString *)fileURLString
          progressBlock:(void(^)(NSInteger totalImagesCroped, NSInteger totalImagesExpectedToCroped))progessBlock
             completion:(void(^)(void))completion{
    
    CGFloat cols = [image size].width / size.width;
    CGFloat rows = [image size].height / size.height;
    
    int fullColumns = floorf(cols);
    int fullRows = floorf(rows);
    
    CGFloat remainderWidth = [image size].width -
    (fullColumns * size.width);
    CGFloat remainderHeight = [image size].height -
    (fullRows * size.height);
    
    if (cols > fullColumns) fullColumns++;
    if (rows > fullRows) fullRows++;
    
    CGImageRef fullImage = [image CGImage];
    
    @autoreleasepool {
    for (int y = 0; y < fullRows; ++y) {
        for (int x = 0; x < fullColumns; ++x) {
            
            NSString *path = [NSString stringWithFormat:@"%@%d_%d",
                              fileURLString, x, y];
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                if (progessBlock) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        progessBlock(y*fullColumns+x,fullColumns*fullRows);
                    });
                }
                if ((y+1 == fullRows) && (x+1 == fullColumns) && completion) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion();
                    });
                }
                continue;
            }
            
            
                CGSize tileSize = size;
                if (x + 1 == fullColumns && remainderWidth > 0) {
                    // Last column
                    tileSize.width = remainderWidth;
                }
                if (y + 1 == fullRows && remainderHeight > 0) {
                    // Last row
                    tileSize.height = remainderHeight;
                }
                
                CGImageRef tileImage = CGImageCreateWithImageInRect(fullImage,
                                                                    (CGRect){{x*size.width, y*size.height},
                                                                        tileSize});
                NSData *imageData = UIImageJPEGRepresentation([UIImage imageWithCGImage:tileImage], 1.0);
                
                CGImageRelease(tileImage);
                
                [imageData writeToFile:path atomically:NO];
                if (progessBlock) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        progessBlock(y*fullColumns+x,fullColumns*fullRows);
                    });
                }
                if ((y+1 == fullRows) && (x+1 == fullColumns) && completion) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion();
                    });
                }
            }
            
        }
    }
}

@end
