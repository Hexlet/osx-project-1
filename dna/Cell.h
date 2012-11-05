//
//  Cell.h
//  dna
//
//  Created by Anton Osenenko on 11/4/12.
//  Copyright (c) 2012 Anton Osenenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly) NSMutableArray *DNA;

- (int)hammingDistance:(Cell *)cell;

@end
