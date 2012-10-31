//
//  main.m
//  DNA
//
//  Created by Roman on 31.10.12.
//  Copyright (c) 2012 BlackGray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
- (void)mutate:(int)procent;
@end

@implementation Cell (mutator)
- (void)mutate:(int)procent{
   
    NSMutableArray * index = [[NSMutableArray alloc]init];
    
    while ([index count]<procent) {
        NSNumber * itemIndex = [[NSNumber alloc]initWithLong:arc4random() % 100];
       
        if (![index containsObject:itemIndex]) {
            [index addObject:itemIndex];
        }
        
    }
    
    for (int i = 0 ; i<[index count]; i++) {
        [dna replaceObjectAtIndex:[[index objectAtIndex:i] intValue] withObject:[variety objectAtIndex:(arc4random() % 4)]];
    }
    
}
@end


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell * cell = [[Cell alloc]init];
        Cell * cell2 = [[Cell alloc]init];
        
        NSLog(@"hamming Distance = %d",[cell hammingDistance:cell2]);
        [cell mutate:100];
        NSLog(@"hamming Distance = %d",[cell hammingDistance:cell2]);
    }
    return 0;
}

