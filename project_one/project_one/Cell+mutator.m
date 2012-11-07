//
//  Cell+mutator.m
//  project_one
//
//  Created by Roman Meshkevich on 02/11/2012.
//  Copyright (c) 2012 Roman Meshkevich. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
-(void) mutate: (int)percent{
    //check between 0 - 100
    if (percent<0 || percent>100){
        @throw [NSException exceptionWithName:@"Invalid parametr" reason:@"percent must be between 0 and 100" userInfo:NULL];
    }
    else
    {
        NSUInteger count = [[self array] count] * percent/ 100;
        NSMutableIndexSet *usedIndexes = [NSMutableIndexSet indexSet];
        
        for(NSUInteger i=0;i<count;i++){
            NSUInteger indexToChange;
            do{
                indexToChange = arc4random()%[[self array] count];
            } while([usedIndexes containsIndex:indexToChange]);
            NSString *prevValue = [[self array] objectAtIndex:indexToChange];
            NSString *newValue = prevValue;
            while ([prevValue isEqualTo:newValue]) {
                newValue = [Cell generateNucleo];
            }
            [[self array] replaceObjectAtIndex:indexToChange withObject:newValue];
            [usedIndexes addIndex:indexToChange];
            
            //NSLog(@"%lu indexToChanged %lu prevValue %@ newValue %@",i,indexToChange,prevValue,newValue);
        }
    }
}
@end
