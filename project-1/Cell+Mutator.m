//
//  Cell+Mutator.m
//  project-1
//
//  Created by Pryshchepa Andrew  on 11/3/12.
//  Copyright (c) 2012 Pryshchepa Andrew . All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

//method to randomly change percent of elements in self.dnaArray
-(void) mutate:(int) percent
{
    if(percent > 100)
        percent = 100;
    
    int numberOfChangedCliches = self.dnaArray.count * percent / 100.0;
    int randomIndex = 0;//index in self.dnaArray where random value will be inserted
    int randomValue = 0;//value to insert into self.dnaArray
    int nextIndexValue = 0;//next unchanged cliche, uses to improve performance
    NSMutableArray* indexArray = [[NSMutableArray alloc] initWithCapacity:numberOfChangedCliches];
    
    for(int i = 0; i < numberOfChangedCliches; ++i) {
    
        randomIndex = arc4random()% self.dnaArray.count;
        //this was used in order to prevend a lot of checking for already changed cliches
        if([indexArray containsObject:[NSNumber numberWithInt:randomIndex ]]) {
            while ([indexArray containsObject:[NSNumber numberWithInt:nextIndexValue]])
                ++nextIndexValue;
            
            randomIndex = nextIndexValue++;
        }
        randomValue = 'A' + arc4random() % DNA_RANGE;
        
        [self.dnaArray setObject:[NSString stringWithFormat:@"%c", randomValue] atIndexedSubscript:randomIndex];
        [indexArray addObject:[NSNumber numberWithInt:randomIndex]];
        
    }
}
@end
