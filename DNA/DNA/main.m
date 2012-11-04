//
//  main.m
//  DNA
//
//  Created by Erik Khalimov on 01.11.12.
//  Copyright (c) 2012 Erik Khalimov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void)mutate:(int)mut;

@end

@implementation Cell (mutator)

-(void)mutate:(int)x
{
    if (x < 0 || x > 100) return;
    
    int countToMut = round([[self dna] count]/100 * x);
    NSArray *simbs = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    NSMutableArray *arrForMut = [NSMutableArray arrayWithCapacity:countToMut];
    while (countToMut){
        NSNumber *val = [NSNumber numberWithInt:(arc4random() % [[self dna] count])];
        if (![arrForMut containsObject:val] ) {
            [arrForMut addObject:val];
            countToMut--;
        }
    }
    
    for (NSNumber *ie in arrForMut){
        int intValue = [ie integerValue];
        BOOL checkFlag = YES;
        do {
            int randomInt = arc4random() % 4;
            if (([[self dna] objectAtIndex:intValue] != simbs[randomInt])) {
                [[self dna] replaceObjectAtIndex:intValue withObject:simbs[randomInt]];
                checkFlag = NO;
            }
        } while (checkFlag);
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cc1 = [[Cell alloc] init];
        Cell *cc2 = [[Cell alloc] init];
        NSLog(@"hammingDistance is %i", [cc1 hammingDistance:cc2]);
        [cc1 mutate:30];
        [cc2 mutate:50];
        NSLog(@"hammingDistance is %i", [cc1 hammingDistance:cc2]);
    
    }
    return 0;
}

