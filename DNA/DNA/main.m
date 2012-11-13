//
//  main.m
//  DNA
//
//  Created by Evgeny Plenkin on 08.11.12.
//  Copyright (c) 2012 EvgenyPlenkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (MutateCell);
-(void)mutate:(int) i;
@end

@implementation Cell (MutateCell)

-(void)mutate:(int)percent {
    int count = 0;
    while (count < percent) {
        int random100 = arc4random() % 99;
        if ([[checkDNA objectAtIndex:random100] isEqualToString:@"NO"])  {
            [checkDNA setObject:@"YES" atIndexedSubscript:random100];
            int random4 = arc4random() % 3;
            [[self DNA] setObject:[letterArray objectAtIndex:random4] atIndexedSubscript:random100];
            count++;
        }
    }
    [self initCheckDNA];
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *firstCell = [[Cell alloc] init];
        Cell *secondCell = [[Cell alloc] init];

        NSLog(@"Hamming distance before mutate:%i",[firstCell hammingDistance:secondCell]);
        
        [firstCell mutate:10];
        [secondCell mutate:35];
        
        NSLog(@"Hamming distance after mutate:%i",[firstCell hammingDistance:secondCell]);
        
    }
    return 0;
}

