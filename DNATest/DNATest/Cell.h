//
//  Cell.h
//  DNATest
//
//  Created by Aliaksandr Słaŭščyk on 01.11.12.
//  Copyright (c) 2012 Aliaksandr Słaŭščyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property NSMutableArray* DNA;
- (int) hammingDistance: (Cell *) cell;
+ (NSArray *) DNA_VALUES;
@end
