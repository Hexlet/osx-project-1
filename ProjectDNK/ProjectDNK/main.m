//
//  main.m
//  ProjectDNK
//
//  Created by Сергей Сергеевич on 11.11.12.
//  Copyright (c) 2012 Сергей Сергеевич. All rights reserved.
//
//final

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
        while (self.DNA[random] == gen)
        {
            gen = [self getRandomGen];
        }
        self.DNA[random] = gen;
    }
}

@end

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        Cell* cell1 = [[Cell alloc] init];
        Cell* cell2 = [[Cell alloc] init];
        int distance = [cell1 hammingDistance:cell2];
        NSLog(@"hamming distance %u", distance);
        
        [cell1 mutate:33];
        [cell2 mutate:45];
        
        distance = [cell1 hammingDistance:cell2];
        NSLog(@"hamming distance %u", distance);
    }
    return 0;
}




