//
//  main.m
//  DNKProject
//
//  Created by IT-Dimension on 11/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator) 

-(void)mutate : (int)mutationRange;

@end

@implementation Cell (Mutator)

-(void)mutate : (int)mutationRange {
        
    NSMutableArray *changedCells = [[NSMutableArray alloc]initWithCapacity:0];
    int numberOfCell,numberOfMutatedCell;
        
    while ([changedCells count]<mutationRange) {
        
        BOOL isNumberChanged = NO;
        do {
            numberOfCell = arc4random()%100;
            isNumberChanged=[changedCells containsObject:[ NSNumber numberWithInt: numberOfCell]];
            if (!isNumberChanged) {
                numberOfMutatedCell = numberOfCell;
               
            }
        } while (isNumberChanged);
        
        BOOL isEqual=NO;
        do {
            NSString *newCellValue = [self generateSymbol];
            BOOL isEqual = [newCellValue isEqualToString:[self.DNA objectAtIndex:numberOfMutatedCell]];
            if (!isEqual) {
                [self.DNA replaceObjectAtIndex:numberOfMutatedCell withObject:newCellValue];
                [changedCells addObject:[NSNumber numberWithInt:numberOfMutatedCell] ];
                }
        } while (isEqual);
    }
    
}
@end


int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        int numberOfMutatedCells = 33;
        
        Cell *newCell1 = [[Cell alloc]init]; 
        Cell *newCell2 = [[Cell alloc]init];
        int humDistBefore=[newCell1 hammingDistance:newCell2];
        NSLog(@"Humming Distance before mutation %i",humDistBefore);
        
                
        [newCell1 mutate:numberOfMutatedCells];
        [newCell2 mutate:numberOfMutatedCells];
        int humDistAfter=[newCell1 hammingDistance:newCell2];
        NSLog(@"Humming Distance after mutation %i",humDistAfter);
          
    }
    return 0;
}

