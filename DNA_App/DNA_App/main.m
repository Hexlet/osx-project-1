//
//  main.m
//  DNA_App
//
//  Created by Anton Stepanov on 05.11.12.
//  Copyright (c) 2012 home. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Cell.h"

@interface Cell (Mutator)

    -(void) mutate: (int) percent;

@end

@implementation Cell (Mutator)

    -(void) mutate: (int) percent {
        if (percent <= 0 || percent > 100) { NSLog(@"ValueError:(%d)\n", percent); return; }
        int replaceElements = round( percent * [DNA count] / 100 );

        NSMutableArray *mutateCard = [[NSMutableArray alloc] init];
        while ( [mutateCard count] < replaceElements ) {
            NSString *mutateIndex = [[NSString alloc] initWithFormat:@"%ld", (int)arc4random()%[DNA count]];
            if (![mutateCard containsObject:mutateIndex]) {
                [mutateCard addObject:mutateIndex];
            }
        }
        //NSLog(@"\nOldDNA:\n(%@)\n\n", [DNA componentsJoinedByString:@""]);
        NSString *tmp;
        NSString *cellIndex;
        NSString *needChars[4] = {@"A", @"T", @"G", @"C"};
        for( int i = 0; i < [mutateCard count]; i++ ) {
            cellIndex = [mutateCard objectAtIndex:i];
            tmp = [DNA objectAtIndex:[cellIndex intValue]];
            
            while ( tmp == [DNA objectAtIndex:[cellIndex intValue]] ) {
                [DNA replaceObjectAtIndex:[cellIndex intValue] withObject:needChars[arc4random()%4]];
            }
        }
        //NSLog(@"\nNewDNA:\n(%@)\n\n", [DNA componentsJoinedByString:@""]);
        NSLog(@"replaceElements: %d\n", replaceElements);
    }

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"Hello, World!");
        
        Cell *nCell1, *nCell2;
        nCell1 = [[Cell alloc] init:100];
        nCell2 = [[Cell alloc] init:100];
        
        [nCell1 showDNA];
        [nCell2 showDNA];
        
        NSLog(@"hammingDistance: %d\n", [nCell1 hammingDistance:nCell2]);
        
        [nCell1 mutate:24];
        [nCell2 mutate:74];
        
        [nCell1 showDNA];
        [nCell2 showDNA];
        
        NSLog(@"NEW hammingDistance: %d\n", [nCell1 hammingDistance:nCell2]);
    }
    return 0;
}

