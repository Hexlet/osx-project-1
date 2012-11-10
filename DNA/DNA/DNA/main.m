//
//  main.m
//  DNA
//
//  Created by Rashid Bakhmudov on 09-11-2012.
//  Copyright (c) 2012 Rashid Bakhmudov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void)mutate: (int)numOfMutations;
@end

@implementation Cell (mutator)
-(void)mutate: (int)numOfMutations{
    NSMutableArray *listOfMutations;
    int mutationIndex;
    
    listOfMutations = [[NSMutableArray alloc] initWithCapacity:DNA.count];
    // Initializing
    for (int i=0;i<DNA.count;i++){
        [listOfMutations addObject:[NSNumber numberWithInt:0]];
    }
    // Mutate
    for (int i=0;i<numOfMutations;i++){
        mutationIndex = arc4random() % DNA.count;
        // Checking
        while ((int)[listOfMutations objectAtIndex:mutationIndex] == 1){
            mutationIndex = arc4random() % DNA.count;
        }
        // Checking generated symbol
        NSString *newSymbol = [self getNewSymbol];
//        while (([newSymbol isEqualToString:[DNA objectAtIndex:mutationIndex]]) || ([newSymbol isEqualToString:@""])){
//            newSymbol = [self getNewSymbol];
//        }
        // replacing
        [DNA replaceObjectAtIndex:mutationIndex withObject:newSymbol];
    }
    
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int numOfMutations = 50;
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"%@",cell1.description);
        NSLog(@"%@",cell2.description);
        NSLog(@"hammingDistance = %i", [cell2 hammingDistance:cell1]);
        
        [cell1 mutate:numOfMutations];
        [cell2 mutate:numOfMutations];
        NSLog(@"%@",@"Mutate DNAs");
        NSLog(@"%@",cell1.description);
        NSLog(@"%@",cell2.description);
        NSLog(@"hammingDistance = %i",[cell2 hammingDistance:cell1]);
        
        
    }
    return 0;
}

