//
//  Cell.h
//  dna-project
//
//  Created by Lenar Kamaev on 31.10.12.
//  Copyright (c) 2012 Lenar Kamaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_ELEMENTS (@[@"A", @"T", @"G", @"C"])
#define COUNT 100

@interface Cell : NSObject

@property NSMutableArray *DNA;

- (int)hammingDistance: (Cell *)otherCell;
@end
