//
//  BT_Rectangle.m
//  TestViewFrame
//
//  Created by 益平廖 on 16/8/24.
//  Copyright © 2016年 liaoyp. All rights reserved.
//

#import "BTRectangle.h"

@implementation BTRectangle

- (instancetype)initWithWidth:(float)width
                    andHeight:(float)height
{
    self = [super init];
    if (self) {
        _width = width;
        _height = height;
    }
    return self;
}

//- (instancetype)init
//{
//    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Must user initWithWidth:(float)width  andHeight:(float)height" userInfo:nil];
//}


- (instancetype)init
{
    return [self initWithWidth:5 andHeight:5];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p, %@>", [self class], self, @{@"width:":@(_width), @"height:": @(_height)}];
}


@end
