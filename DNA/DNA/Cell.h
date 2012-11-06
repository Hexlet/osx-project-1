//
//  Cell.h
//  DNA
//
//  Created by xxsnakerxx on 30.10.12.
//  Copyright (c) 2012 xxsnakerxx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (nonatomic, strong) NSMutableArray *DNA;
@property (nonatomic, readonly, strong) NSArray *dnaKeys;

- (void)print;
- (int)hammingDistance:(Cell *)cell;
@end
