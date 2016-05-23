//
//  HGLSphereView.h
//  球体图片选择器
//
//  Created by 黑锅 on 16/5/21.
//  Copyright © 2016年 黑锅. All rights reserved.
//

#ifndef sphereTagCloud_HGLPoint_h
#define sphereTagCloud_HGLPoint_h

struct HGLPoint {
    CGFloat x;
    CGFloat y;
    CGFloat z;
};

typedef struct HGLPoint HGLPoint;


HGLPoint HGLPointMake(CGFloat x, CGFloat y, CGFloat z) {
    HGLPoint point;
    point.x = x;
    point.y = y;
    point.z = z;
    return point;
}

#endif
