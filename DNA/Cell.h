//
//  Cell.h
//  DNA
//
//  Created on 03.11.12.
//  Copyright (c) 2012 hexlet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray* DNA;
}
    -(NSUInteger) hammingDistance: (Cell*) in;
@end

@interface Cell (Mutator)
    -(void) mutate: (NSUInteger) percent;
@end