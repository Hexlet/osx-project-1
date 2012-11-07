//
//  main.m
//  dna
//
//  Created by Yuriy Ostapyuk on 11/4/12.
//  Copyright (c) 2012 Yuriy Ostapyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#include <stdlib.h>

@interface Cell (Mutator)
    - (void) mutate:(int) percent;
@end

@implementation Cell (Mutator)

    - (void) mutate:(int) percent {
        NSNumber *index;
        
        // sequence on nucliotides
        
        // array to store already processed indexes
        NSMutableArray *indexes = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < percent; i++) {
            // getting random index of nucliotide
            index = [NSNumber numberWithInteger:arc4random()%100];

            // if current nucliotide was not changed yet
            if (![indexes containsObject: index]) {
                 
                // storing index of changed nucliotide
                [indexes addObject:index];
            }
        }
        
        // changing nucliotide in dna structure
        for(NSNumber *i in indexes) {            
            self.dna[[i intValue]] = [Cell getNucliotideFromArray];
        }
    }

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell * cell1 = [[Cell alloc] init];
        Cell * cell2 = [[Cell alloc] init];
        
        // displaying hamming distance between cells
        NSLog(@"Cells hamming distance %i", [cell1 hammingDistance:cell2]);
        
        // mutating first cell
        [cell1 mutate:25];
        
        // mutating second cell
        [cell2 mutate:75];
        
        // displaying second hamming d after mutation istance between cells
        NSLog(@"Cells hamming distance %i", [cell1 hammingDistance:cell2]);
    }
    return 0;
}

