//
//  main.m
//  DNA
//
//  Created by Dmitry Davidov on 04.11.12.
//  Copyright (c) 2012 Dmitry Davidov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)

-(void) mutate:(int)rate;

@end

@implementation Cell (Mutator)

-(void) mutate:(int)rate {
    int COUNT = 100;
    
    if (rate < 0 || rate > 100)
        @throw [NSException exceptionWithName:@"CellException" reason:@"Wrong rate value." userInfo:nil];
    
    NSMutableArray *positions = [NSMutableArray array];
    for (int i = 0; i < COUNT; ++i)
        [positions addObject:[NSNumber numberWithBool:NO]];
    
    while (rate--) {
        int pos = -1;
        do {
            pos = rand() % COUNT;
        } while ([positions objectAtIndex:pos] == [NSNumber numberWithBool:YES]);
        [positions replaceObjectAtIndex:pos withObject:[NSNumber numberWithBool:YES]];
        
        [self randomizeAt:pos];
//        NSLog(@"%d", pos);
    }
}

@end

int main(int argc, const char * argv[])
{
    @autoreleasepool {
//        srand([[NSDate date] timeIntervalSince1970]);
        
        Cell *c1 = [[Cell alloc] init];
        Cell *c2 = [[Cell alloc] init];
        
        NSLog(@"hamming distance before mutation = %d", [c1 hammingDistance:c2]);
        
        [c1 mutate:100];
        
        NSLog(@"hamming distance after mutation = %d", [c1 hammingDistance:c2]);
    }
    return 0;
}

