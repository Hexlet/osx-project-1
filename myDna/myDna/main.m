//
//  main.m
//  myDna
//
//  Created by Sergii on 10/31/12.
//  Copyright (c) 2012 Sergii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void) mutate:(int)percent;
@end

@implementation Cell (mutator)
-(void) mutate:(int)percent {
   
    NSMutableArray *uniqNumbers = [[NSMutableArray alloc] init];
    
    while ([uniqNumbers count] < percent) {
        int r = arc4random() % 100;
        if (![uniqNumbers containsObject:[NSNumber numberWithInteger:r]]) {
            [uniqNumbers addObject: [NSNumber numberWithInteger:r]];
            [DNA setObject:[self getRandom] atIndexedSubscript:r];
        }
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *myCell1 = [[Cell alloc] init];
        Cell *myCell2 = [[Cell alloc] init];
        
        NSLog(@"Normal hammingDistance: %i", [myCell1 hammingDistance:[myCell2 getDNA]]);
        
        [myCell1 mutate:50];
        [myCell2 mutate:50];
        
        NSLog(@"Mutated hammingDistance: %i", [myCell1 hammingDistance:[myCell2 getDNA]]);
        
    }
    return 0;
}

