//
//  main.m
//  DNA
//
//  Created by deron on 04.11.12.
//  Copyright (c) 2012 deron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
@interface Cell(mutator)
-(void)mutate:(int)value;
@end


@implementation Cell(mutator)
-(void)mutate:(int)percent{
    NSMutableArray *mutatedGensPositions = [[NSMutableArray alloc] initWithCapacity:percent];
    for(int i=0;i<percent;++i){
        int genPosition=0;
        do{
            genPosition=arc4random()%100;
        }
        while ([mutatedGensPositions containsObject:[NSNumber numberWithInt:genPosition]]);
        NSString *generator = [[self DNA] objectAtIndex:genPosition];
        NSString *mutatedGen = nil;
        do{
            mutatedGen=[[self DNAsrc]objectAtIndex:arc4random()%4];
        }
        while([mutatedGen isEqualToString:generator]);
        [[self DNA]replaceObjectAtIndex:genPosition withObject:mutatedGen];
        [mutatedGensPositions addObject:[NSNumber numberWithInt:genPosition]];
    }
}
@end


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *firstCell=[[Cell alloc]init];
        Cell *secondCell=[[Cell alloc]init];
        
        
        NSLog(@"Hamming distance before mutation = %i",[firstCell hammingDistance:secondCell]);
        [firstCell mutate:5];
        [secondCell mutate:35];
        NSLog(@"Hamming distance after mutation = %i",[firstCell hammingDistance:secondCell]);
    }
    return 0;
}

