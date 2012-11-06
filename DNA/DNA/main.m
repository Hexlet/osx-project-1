//
//  main.m
//  DNA
//
//  Created by dk on 04.11.12.
//  Copyright (c) 2012 dk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
-(void) mutate: (int) percent;
@end

@implementation Cell (Mutator)
-(void)mutate:(int)percent
{
    NSString *values[4] = {@"A", @"T", @"G", @"C"};
    
    for(int i=0; i < 50; i++)
    {
        int rnd = arc4random() % 100;
        
        if (rnd <= percent - 1)
        {
            [self.dna replaceObjectAtIndex:i withObject:values[arc4random() % 4]];
        }
    }
}
@end

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell1 = [[Cell alloc]init];
        Cell *cell2 = [[Cell alloc]init];
        
        int distance = [cell1 hummingDistance:cell2];
        NSLog(@"%i", distance);
        
        [cell1 mutate:20];
        [cell2 mutate:40];
        
        distance = [cell1 hummingDistance:cell2];
        NSLog(@"%i", distance);
    }
    
    return 0;
}

