//
//  main.m
//  Project1
//
//  Created by brevis on 10/31/12.
//  Copyright (c) 2012 brevis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void)mutate:(int)count;

@end

@implementation Cell (mutator)

-(void)mutate:(int)x
{
    NSMutableArray *indexes = [NSMutableArray arrayWithCapacity:100];
    for (int i=0; i<100; i++)
    {
        [indexes addObject:[NSNumber numberWithUnsignedInteger:i]];
    }
    [self shuffle:indexes];
    

    for (int i=0; i<x; i++)
    {
        NSString *g = [self.DNA objectAtIndex:[[indexes objectAtIndex:i] intValue] ];
        [self.DNA replaceObjectAtIndex:[[indexes objectAtIndex:i] intValue] withObject:[self getRandomGeneExclude:g]];
    }
    
}

-(void)shuffle:(NSMutableArray*)array
{
    NSUInteger count = [array count];
    for (NSUInteger i = 0; i < count; ++i)
    {
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [array exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

-(NSString*)getRandomGeneExclude:(NSString *)gene
{
    NSString *g;
    
    do {
        g = [possibleGenes objectAtIndex:arc4random()%4];
    } while ( [g isEqualToString:gene] );
    
    return g;
}

@end


int main(int argc, const char * argv[])
{

    @autoreleasepool {
                
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"Distance before mutation: %d", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:arc4random()%101];
        [cell2 mutate:arc4random()%101];
        
        NSLog(@"Distance after mutation: %d", [cell1 hammingDistance:cell2]);
    }
    
    return 0;
}

