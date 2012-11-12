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
        NSMutableArray *arrayOfRandIndex = [NSMutableArray arrayWithCapacity:percentage]; //array of random index
        
        while (arrayOfRandIndex.count<percentage+1) { //filling arrayOfRandIndex with 0<randIndex<dna.count
            int range = (int)self.dna.count;
            NSNumber *randIndex = [NSNumber numberWithInt: arc4random_uniform(range) ];
            if ([arrayOfRandIndex containsObject:randIndex]==NO){
                [arrayOfRandIndex addObject:randIndex];
            }
        }
        
        NSArray *setOfSymb = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C",nil];
        
        for (int i=0; i<arrayOfRandIndex.count; i++) {     //mutating
            NSInteger randomIndex = arc4random_uniform(4);  //generating random char (A,G,T,C)
            NSString *randomChar = [setOfSymb objectAtIndex:randomIndex];
            
            NSInteger randReplaceIndex = [[arrayOfRandIndex objectAtIndex:i] integerValue]; //getting index from arrayOfRandIndex
            [self.dna replaceObjectAtIndex:randReplaceIndex withObject:randomChar]; //placing char to dna
        }
        
    } else {
        NSLog(@"WRONG PERCENTAGE! MUST BE 0<percentage<101");
    }
}
@end
