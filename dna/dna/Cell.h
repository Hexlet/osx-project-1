//
//  Cell.h
//  dna
//
//  Created by Vitaly Larchenkov on 11/9/12.
//  Copyright (c) 2012 Vitaly. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdlib.h>


//const NSArray *genes = [[NSArray alloc] initWithObjects:(char)'A',(char)'T', (char)'G', (char)'C', nil];
// A, T, G, С
@interface Cell : NSObject {
    NSMutableArray *DNA;
    NSMutableArray * usedGenes;
}
-(int)hammingDistance:(Cell*)sample;
-(id)getRandomGene;
-(NSMutableArray*)getDna;
@end

@interface Cell (mutator)
-(void)mutate:(int)percentOfMutations;
@end