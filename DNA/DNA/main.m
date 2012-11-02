//
//  main.m
//  DNA
//
//  Created by Anton on 01.11.12.
//  Copyright (c) 2012 Anton Matrenin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (MutateCategory)

-(void) Mutate: (int) procent;

@end

@implementation Cell (MutateCategory)

-(void) Mutate: (int) procent;
{
    NSMutableArray *busyPosition = [[NSMutableArray alloc] initWithCapacity:procent];
    for (int i = 0; i < procent; i++)
    {
        int pos = arc4random() % 100;
        NSString *posStr = [NSString stringWithFormat:@"%d", pos];
        if(![self.DNA containsObject: posStr])
        {
            [self.DNA removeObjectAtIndex: pos];
            [self.DNA insertObject: [self GetRandomDNASymbol] atIndex:pos];
            [busyPosition addObject: posStr];
        }
        else
            i--;
    }
}

@end

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Cell *c1 = [[Cell alloc] init];
        Cell *c2 = [[Cell alloc] init];
        
        int dist = [c1 HammingDistance: c2];
        
        [c1 Mutate: 30];
        [c2 Mutate: 30];
        
        int dist2 = [c1 HammingDistance: c2];
        
        NSLog(@"\n\nBefore mutation: %i \nAfter mutation: %i", dist, dist2);
    }
    return 0;
}

