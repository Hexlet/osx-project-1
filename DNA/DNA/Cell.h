//
//  Cell.h
//  DNA
//
//  Created by Foboz on 11.11.12.
//  Copyright (c) 2012 Foboz. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_SIZE    100

@interface Cell : NSObject
@property (nonatomic, strong) NSMutableArray *DNA;
- (int) hammingDistance:(Cell *)cell;
+ (NSArray *) getSymbols;
@end
