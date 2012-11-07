//
//  VVCell.h
//  Lecture2
//
//  Created by Vadim Vatlin on 11/7/12.
//  Copyright (c) 2012 Vadim Vatlin. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSInteger const dnaLength;

//Cell class
@interface VVCell : NSObject {
    NSArray* dnaType;
}

@property (nonatomic, retain) NSMutableArray* DNA;
- (NSInteger) hammingDistance:(VVCell*) aCell;

@end

// mutator category
@interface VVCell (mutator)
- (void) mutate:(NSInteger) count;
@end