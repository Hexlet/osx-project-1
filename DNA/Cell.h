//
//  Cell.h
//  DNA
//
//  Created by Anton Umnitsyn on 5/11/12.
//  Copyright (c) 2012 Anton Umnitsyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *dna;
    NSArray *proteins;
}

@property (nonatomic, readonly) NSMutableArray *dna;

- (int)hammingDistance:(Cell *)cell;
- (void)printDNA;

@end
