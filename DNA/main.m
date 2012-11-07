//
//  main.m
//  DNA
//
//  Created by Сергей Греков on 06.11.12.
//  Copyright (c) 2012 Сергей Греков. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell(mutator)

-(void)mutate:(int)x;
@end

@implementation Cell(mutator)

-(void)mutate:(int)x{
    int percent = x *([self.DNA count] / 100);
    NSMutableDictionary * usedIndexes = [[NSMutableDictionary alloc] init];
    for (int i = 0; i <= percent; i++){
        int randomEl = arc4random() % [self.DNA count];
        NSString *randomElStr = [NSString stringWithFormat:@"%d",randomEl];
        if (![usedIndexes objectForKey:randomElStr]){
            [usedIndexes setValue:@"ELEMENT_EXIST" forKey:randomElStr];
            int randomLetter = arc4random() % 4;
            [self.DNA replaceObjectAtIndex:randomEl withObject:[dict objectAtIndex:randomLetter]];
        }
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        int distance1 = [cell2 hammingDistance:cell1];
        NSLog(@"HAMMING DISTANCE1 %d",distance1);
        [cell1 mutate:distance1];
        [cell2 mutate:distance1];
        int distance2 = [cell2 hammingDistance:cell1];
        NSLog(@"HAMMING DISTANCE2 %d",distance2);
        
    }
    return 0;
}

