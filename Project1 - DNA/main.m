//
//  main.m
//  Project1 - DNA
//
//  Created by Dennis Dmitriev on 10.11.12.
//  Copyright (c) 2012 Dennis Dmitriev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell(mutator)
-(void) mutate: (int) j;
@end

@implementation Cell(mutator)
-(void) mutate: (int) j {
    NSMutableArray *tmp = [[NSMutableArray alloc] init];
    int i = 0;
    while (i!=j) {
        NSNumber *randNum = [NSNumber numberWithInt:arc4random()%100];
        if ([tmp containsObject:randNum]) {} else {
            [tmp addObject:randNum];
            i++;
        }
    }
    for (int i=0; i<j; i++) {
        int pos = [[tmp objectAtIndex:i] intValue];
        NSString *n = [DNA objectAtIndex:pos];
        NSString *t = [DNA objectAtIndex:pos];
        while ([n isEqualToString:t]) {
            t = [self.Tags objectAtIndex:arc4random()%4];
        }
        [DNA replaceObjectAtIndex:pos withObject:t];
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *myCell, *myCell2;
        myCell = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
        NSLog(@"hamming distance %d", [myCell hammingDistance:myCell2]);
        [myCell mutate:10];
        [myCell2 mutate:10];
        NSLog(@"hamming distance %d after the mutation", [myCell hammingDistance:myCell2]);        
        NSLog(@"feels good!");
    }
    return 0;
}

