//
//  Cell.h
//  osx-project-1
//
//  Created by smoke on 11.11.12.
//  Copyright (c) 2012 smoke. All rights reserved.
//

#import <Foundation/Foundation.h>
#define DNA_LENGTH 100
#define DNA_ELEMENTS (@[@"A", @"T", @"G", @"C"])

@interface Cell : NSObject

@property NSMutableArray *DNA;
- (id)init;
- (int)hammingDistance: (Cell *) cell;
+ (id)getRandomDNAElement;
@end
