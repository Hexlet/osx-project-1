//
//  Cell+mutator.m
//  DNK
//
//  Created by evgen on 11/13/12.
//  Copyright (c) 2012 evgen. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

-(void) mutate:(int)percent {
    //array with random numbers to check if the new number repeats
    NSMutableArray *repeatCheckArray = [NSMutableArray array];
    
    for (int i=1; i<percent; ++i){
              
        int randindex = [Cell getRandIndex];
        if ([repeatCheckArray containsObject:[NSNumber numberWithInteger:randindex]]) {
            --i; //if this number was generated again the new iteration
        }
        else //else we will change this character with new one
            [[self DNA] replaceObjectAtIndex:randindex withObject:[Cell getRandomCharacter]];
    }
        
}
//get random index for changing characters in array
+(int) getRandIndex{
    int x = arc4random() % 99 + 1;
    return x;
}
@end
