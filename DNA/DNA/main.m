//
//  main.m
//  DNA
//
//  Created by Axel on 30.10.12.
//  Copyright (c) 2012 Axel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void) mutate:(int)percent;
@end
@implementation Cell (mutator)

-(void) mutate:(int)percent{
    if((percent > 0) && (percent < 100)){
        int count = percent / 100.0 * [self.DNA count];
        for(int i = 0; i < count; i++){
            [self.DNA replaceObjectAtIndex:arc4random()%[self.DNA count] withObject:@"0"];
        }
        for(int i = 0; i < [self.DNA count]; i++){
            if([self.DNA objectAtIndex:i] == @"0"){
                [self.DNA replaceObjectAtIndex:i  withObject:[Cell genLatter:arc4random()%3]];
            }
        }
    }else{
        NSLog(@"An invalid value");
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"Hamming distance: %li", [cell1 hammingDistance:cell2]);
        [cell1 mutate:45];
        [cell2 mutate:83];
        NSLog(@"Hamming distance after mutate: %li", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}

