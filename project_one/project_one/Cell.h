//
//  Cell.h
//  project_one
//
//  Created by Roman Meshkevich on 02/11/2012.
//  Copyright (c) 2012 Roman Meshkevich. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Cell : NSObject

@property NSMutableArray *array;

+ (NSString*)generateNucleo;

- (int) hammingDistance:(Cell*) cell;

@end
