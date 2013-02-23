//
//  main.m
//  aproDNA
//
//  Created by apro on 07.01.13.
//  Copyright (c) 2013 apro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
    -(void) mutate: (int) x;
@end

@implementation Cell (mutator)

-(void) mutate:(int)x{
    NSMutableArray *mChange = [[NSMutableArray alloc] init];
    for (i = 0; i<=99; i++) {
        [mChange addObject:@"0"];
    }
    i = 0;
    while (i<x) {
        int rndCell = (random() % 100);
        if ([[mChange objectAtIndex:rndCell] isEqual:@"0"]) {
            NSString *nd;
            nd = [letter objectAtIndex:random() % 4];
            if (![[DNA objectAtIndex:rndCell] isEqual:nd]) {
                [DNA replaceObjectAtIndex:rndCell withObject:nd];
                [mChange replaceObjectAtIndex:rndCell withObject:@"1"];
                i++;
            }
        }
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        srandom((unsigned)time(NULL));
        Cell *cellOne;
        cellOne = [[Cell alloc]init];
        
        Cell *cellTwo;
        cellTwo = [[Cell alloc]init];
        
        NSLog(@"How many mutate?");
        int cnt = 0;
        scanf("%i", &cnt);
        
        NSLog(@"Before mutation");
        //[cellOne print];
        //[cellTwo print];
        
        int h = [cellOne hammingDistance:cellTwo];
        NSLog(@"HD = %i", h);
        
        [cellOne mutate:cnt];
        [cellTwo mutate:cnt];
        
        NSLog(@"After mutation");
        //[cellOne print];
        //[cellTwo print];
        
        h = [cellOne hammingDistance:cellTwo];
        NSLog(@"HD = %i", h);
        
        //NSMutableArray *array = [NSMutableArray arrayWithCapacity:100];
        
        /* NSArray *array = [[NSArray alloc] initWithObjects:@"one",@"two", @"three", nil];
        NSRange range;
        range.length = 2;
        range.location = 0;
        NSArray *newArray = [array subarrayWithRange:range];
        NSLog(@"%@", newArray);
        NSLog(@"%d", [array count]);
        NSMutableArray *marray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 10; i++) {
            int newElement = arc4random() % 40;
            //int newElement = random();
            [marray addObject:[NSString stringWithFormat:@"%d", newElement]];
        }
        NSLog(@"%@", marray);*/
        
        
    }
    return 0;
}

