//
//  Cell.h
//  project1-dna
//
//  Created by DaZzz on 02.11.12.
//  Copyright (c) 2012 DaZzz. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableArray (Random)

-(id)randomObject;

@end

@interface NSMutableArray (Shuffle)

- (void) shuffle;
- (void) swap: (int)i with: (int)j;

@end

@interface Cell : NSObject {
    NSMutableArray *symbols;
}
@property (readonly) NSMutableArray *DNA;

- (id)init;
- (int)hammingDistanceTo: (Cell*)aCell;
- (NSString *)description;

@end

@interface Cell (Mutator)

- (void) mutate: (int)percentage;

@end
