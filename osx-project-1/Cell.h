//
//  Cell.h
//  osx-project-1
//
//  Created by bj on 03.11.12.
//  Copyright (c) 2012 bj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *dna;
@property NSArray *dnaSimbols;

- (int) hammingDistance:(Cell *)cell;
@end