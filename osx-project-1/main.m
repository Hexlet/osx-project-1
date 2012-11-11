//
//  main.m
//  osx-project-1
//
//  Created by bj on 03.11.12.
//  Copyright (c) 2012 bj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell(mutator)

- (void) mutate:(int)percent;

@end

@implementation Cell(mutator)

-(void)mutate:(int)percent
{
    NSMutableArray *elementIndex = [NSMutableArray array];
    NSNumber *index = [NSNumber numberWithInt:0];
    
    do {
        index = [NSNumber numberWithInt:(arc4random() % 100)];
        
        if ([elementIndex indexOfObject:index] == NSNotFound) {
            [elementIndex addObject:index];
        }
    } while (percent > [elementIndex count]);
    
    for (NSInteger i = 0; i<percent; i++) {
        [[self dna] replaceObjectAtIndex:[[elementIndex objectAtIndex:i] integerValue]
                              withObject:[[self dnaSimbols] objectAtIndex:(arc4random() % [[self dnaSimbols] count])]];
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"result 1 = %i", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:14];
        [cell2 mutate:86];
        
        NSLog(@"result 2 = %i", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}

