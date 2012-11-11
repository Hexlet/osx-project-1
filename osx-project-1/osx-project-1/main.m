//
//  main.m
//  osx-project-1
//
//  Created by Антон on 11.11.12.
//  Copyright (c) 2012 FerumFlex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
    -(void) mutate:(int) count;
@end

@implementation Cell (mutator)

-(void) mutate:(int) count {
    
    if (count >= 100)
        return;
    
    NSMutableArray* used = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i<count; i++)
    {
        int random = arc4random_uniform(100);
        while ([used indexOfObjectIdenticalTo:@(random)] != NSNotFound) {
            random = arc4random_uniform(100);
        }
        
        [used addObject:@(random)];
    
        NSString* gen = [self getRandomGen];
        while (DNA[random] == gen)
        {
            gen = [self getRandomGen];
        }
        DNA[random] = gen;
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell* cell1 = [[Cell alloc] init];
        Cell* cell2 = [[Cell alloc] init];
        int distance = [cell1 hammingDistance:cell2];
        NSLog(@"Distance %u", distance);
        
        [cell1 mutate:10];
        [cell2 mutate:15];
        
        distance = [cell1 hammingDistance:cell2];
        NSLog(@"Distance %u", distance);
    }
    return 0;
}

