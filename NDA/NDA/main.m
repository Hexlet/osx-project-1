//
//  main.m
//  NDA
//
//  Created by Nestor on 11.11.12.
//  Copyright (c) 2012 Nestor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell (mutator)
-(void) mutate: (int) x;
@end

@implementation Cell (mutator)

-(void) mutate: (int) x {    
    NSMutableArray *tmpArray;
    for (NSUInteger i = 0; i < x; i++) {
        NSNumber *randomIndex = [NSNumber numberWithInt:(arc4random() % self.dnaLength)];
        
        while([tmpArray indexOfObject:randomIndex] > 0) {
           randomIndex = [NSNumber numberWithInt:(arc4random() % self.dnaLength)];
        }
        
        [tmpArray addObject: randomIndex];
        int index = arc4random() % 4;
        self.DNA[[randomIndex intValue]] = self.letters[index];
    }
    
}
@end


int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell, *cell2;
        cell = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        int distance1, distance2;
        distance1 = [cell hammingDistance:cell2];
        NSLog(@"First distance = %d", distance1);
    
        [cell mutate: 10];
        [cell2 mutate: 10];
        distance2 = [cell hammingDistance:cell2];
        NSLog(@"Distance after mutation = %d", distance2);
    }
    return 0;
}

