//
//  Cell.h
//  DNA
//
//  Created by ilya on 11/2/12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;
@property NSArray *types;

- (int) hammingDistance: (Cell *) c;
- (NSString *) findGenNot: (NSString *) current;

@end
