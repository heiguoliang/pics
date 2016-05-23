//
//  HGLSphereView.h
//  球体图片选择器
//
//  Created by 黑锅 on 16/5/21.
//  Copyright © 2016年 黑锅. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HGLSphereView : UIView
- (void)setCloudTags:(NSArray *)array;
- (void)timerStart;
- (void)timerStop;
@end
