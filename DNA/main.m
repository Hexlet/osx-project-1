//
//  main.m
//  DNA
//
//  Created by Dmytro Povechanin on 06.11.12.
//  Copyright (c) 2012 Dmytro Povechanin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
    -(void)mutate:(int)percent;
@end

@implementation Cell (Mutator)
    
    -(void)mutate:(int)percent{
        NSLog(@"Mutating %d elements", percent);
        NSMutableArray *mutatedDNA=[[NSMutableArray alloc] initWithCapacity:CELL_DIMENTION];
        int i;
        for (i = 0; i < CELL_DIMENTION; i++) [mutatedDNA addObject:[NSNumber numberWithBool:NO]];
        NSMutableArray *srcDNA=[self getDNA];
        NSArray *DNA_SRC = [NSArray arrayWithObjects:@"A", @"T", @"G",@"C", nil];
        
        if (percent <= CELL_DIMENTION ){
            while (percent){
                int mutatePos = arc4random() % CELL_DIMENTION;
                NSString *mutatedItem =[DNA_SRC objectAtIndex:arc4random()%3];
                if ([[mutatedDNA objectAtIndex:mutatePos] isEqual:[NSNumber numberWithBool:NO]] && ![mutatedItem isEqual:[srcDNA objectAtIndex:mutatePos]]){
                    [srcDNA replaceObjectAtIndex:mutatePos withObject:mutatedItem];
                    [mutatedDNA replaceObjectAtIndex:mutatePos withObject:[NSNumber numberWithBool:YES]];
                    percent--;
                }
            }
        } else {
            NSLog(@"Incorrect number of mutations");
        }
    }

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *customDNA1, *customDNA2;
        customDNA1 = [[Cell alloc] init];
        customDNA2 = [[Cell alloc] init];
        
        NSLog(@"DNA looks like %@", customDNA1);
        int distance;
        distance = [Cell hammingDistance:customDNA1 trgt:customDNA2];
        NSLog(@"The distance between 2 DNAs is %i", distance);
        
        [customDNA1 mutate:10];
        [customDNA2 mutate:20];
        distance = [Cell hammingDistance:customDNA1 trgt:customDNA2];
        NSLog(@"The distance between 2 mutated DNAs is %i", distance);
    }
    return 0;
}

