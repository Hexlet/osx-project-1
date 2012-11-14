//
//  Cell.h
//  DNAAssighment
//
//  Created by Oleg Langer on 30.10.12.
//  Copyright (c) 2012 Oleg Langer. All rights reserved.
//

#import <Foundation/Foundation.h>
#define SIZE_OF_DNA_ARRAY 100


@interface Cell : NSObject

@property NSMutableArray *dna;

- (int) hammingDistance: (Cell*)cell;
- (NSString*) randomSymbol;

@end
