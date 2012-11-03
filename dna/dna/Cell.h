//
//  Cell.h
//  dna
//
//  Created by Igor Pavlov on 02.11.12.
//  Copyright (c) 2012 Igor Pavlov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Cell : NSObject
{
    NSMutableArray  *dna;
}

+ (u_int32_t) getDnaAlphabetSize;
+ (u_int32_t) getDnaCharCount;

- (id) init;
- (int) hammingDistance:(Cell*)otherCell;
- (NSString*) toString;
- (Cell*) clone;

@end
