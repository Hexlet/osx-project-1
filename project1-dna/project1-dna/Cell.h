//
//  Cell.h
//  project1-dna
//
//  Created by DaZzz on 02.11.12.
//  Copyright (c) 2012 DaZzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#define CELL_SIZE 100

@interface NSMutableArray (Random)

-(id)randomObject;

@end

@interface NSMutableArray (Shuffle)

- (void) shuffle;
- (void) swap: (int)i with: (int)j;

@end

@interface Cell : NSObject

@property (readonly) NSMutableArray *DNA, *symbols;

- (id)init;
- (int)hammingDistanceTo: (Cell*)aCell;

@end

