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

- (void) mutate:(int)x;

@end

@implementation Cell(mutator)

-(void)mutator:(int)x
{
    NSMutableArray *unicNumbers = [NSMutableArray array];
    for(int i = 0; i < 100; i++)
        [unicNumbers addObject: [NSNumber numberWithInt:i]];
    
    NSUInteger size, position;
    for (int i = 0; i < x; i++) {
        size = [unicNumbers count];
        if (size > 0)
            
            position = (arc4random() % size);
        NSNumber *unicRandomNumber = [unicNumbers objectAtIndex:position];
        
        [self.dna replaceObjectAtIndex:[unicRandomNumber intValue]
                            withObject:[self.dnaSimbols objectAtIndex:arc4random() % [self.dnaSimbols count]]];
        
        [unicNumbers removeObjectAtIndex:position];
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"result 1 = %i", [cell1 hammingDistance:cell2]);
        
        [cell1 mutator:14];
        [cell2 mutator:86];
        
        NSLog(@"result 2 = %i", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}

