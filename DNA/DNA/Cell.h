//
//  Cell.h
//  DNA
//
//  Created by Makarenko Vitali on 03.11.12.
//  Copyright (c) 2012 Makarenko Vitali. All rights reserved.
//

#import <Foundation/Foundation.h>
#define DNA_ELEMENTS (@[@"A", @"T", @"G", @"C"])
#define COUNT 100

@interface Cell : NSObject
@property NSMutableArray *DNA;
- (int)hammingDistance: (Cell *)otherCell;
@end
