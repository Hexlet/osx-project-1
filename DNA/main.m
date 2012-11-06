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
        int i;
        NSArray *DNA_SRC = [NSArray arrayWithObjects:@"A", @"T", @"G",@"C", nil];
        for(i = 0; i < percent; i++){
            [self.getDNA replaceObjectAtIndex:i withObject:[DNA_SRC objectAtIndex:arc4random()%3]];
        }
    }
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *customDNA1, *customDNA2;
        customDNA1 = [[Cell alloc] init];
        customDNA2 = [[Cell alloc] init];
        
        //[customDNA print];
        int distance;
        distance = [Cell hammingDistance:customDNA1 trgt:customDNA2];
        NSLog(@"The distance between 2 DNAs is %i", distance);
        
        [customDNA1 mutate:30];
        [customDNA2 mutate:50];
        distance = [Cell hammingDistance:customDNA1 trgt:customDNA2];
        NSLog(@"The distance between 2 mutated DNAs is %i", distance);
    }
    return 0;
}

