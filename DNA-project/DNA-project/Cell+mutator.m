//
//  Cell+mutator.m
//  DNA-project
//
//  Created by Sergey Gorelov on 12.11.12.
//  Copyright (c) 2012 Sergey Gorelov. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
-(void) mutate:(int) percentage {
    if (percentage<101 && percentage>0){ //check for right percentage input value
        
        int n = self.dna.count*percentage/100; //convert percentage into quantity
        NSMutableArray *arrayOfRandIndex = [NSMutableArray arrayWithCapacity:n]; //array of n random indexes
        while (arrayOfRandIndex.count<n) { //filling arrayOfRandIndex with 0<randIndex<dna.count
            int range = (int)self.dna.count;
            NSNumber *randIndex = [NSNumber numberWithInt: arc4random_uniform(range) ];
            if ([arrayOfRandIndex containsObject:randIndex]==NO){
                [arrayOfRandIndex addObject:randIndex];
            }
        }
        
        NSArray *setOfSymb = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C",nil];
        int i=0;
        while (i<arrayOfRandIndex.count) {     //mutating
            NSUInteger replaceIndex = [[arrayOfRandIndex objectAtIndex:i] integerValue]; //getting index value from arrayOfRandIndexˆ
            NSString *randomChar = [setOfSymb objectAtIndex:arc4random_uniform(4)];
            if ([[self.dna objectAtIndex:replaceIndex] isEqualTo:randomChar] == NO){ //if generated randChar != previous char
                [self.dna replaceObjectAtIndex:replaceIndex withObject:randomChar]; //placing char to dna[index]
                i++;
            }
        }
        
    } else {
        NSLog(@"WRONG PERCENTAGE! MUST BE 0<percentage<101");
    }
}
@end
