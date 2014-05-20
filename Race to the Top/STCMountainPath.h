//
//  STCMountainPath.h
//  Race to the Top
//
//  Created by Stefan Claussen on 19/05/2014.
//  Copyright (c) 2014 One foot after the other. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STCMountainPath : NSObject

+ (NSArray *)mountainPathsForRect:(CGRect)rect;

+ (UIBezierPath *)tapTargetForPath:(UIBezierPath *)path;

@end
