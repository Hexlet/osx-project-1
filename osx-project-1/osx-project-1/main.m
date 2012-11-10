//
//  main.m
//  osx-project-1
//
//  Created by Mac on 09.11.12.
//  Copyright (c) 2012 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void)mutate:(int) m;
@end

@implementation Cell(mutator)

-(void) mutate:(int)m{
    int j = 0;
    while(j < m){
        int i = arc4random_uniform(m);
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
        [array removeObject:[self.DNA objectAtIndex:i]];
        NSUInteger rChar = arc4random_uniform(3);
        [self.DNA removeObjectAtIndex:i];
        [self.DNA insertObject:[NSString stringWithFormat:@"%@",[array objectAtIndex: rChar]] atIndex:i];
        j++;
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell;
        cell = [[Cell alloc] init];
        
        Cell *cell2;
        cell2 = [[Cell alloc] init];
        
        NSLog(@"hamming distance: %i",[cell hammingDistance:cell2]);
        
        [cell mutate:random()%100+1];
        [cell2 mutate:random()%100+1];
        
        NSLog(@"hamming distance mutate: %i",[cell hammingDistance:cell2]);
        
    }
    return 0;
}

