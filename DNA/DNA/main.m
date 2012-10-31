//
//  main.m
//  DNA
//
//  Created by Администратор on 10/30/12.
//  Copyright (c) 2012 Zed Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
-(void)mutate:(int)percent;
@end

@implementation Cell (Mutator)

-(void)mutate:(int)percent {
    int percentMutated = 0;
    srandomdev();
    for (int i = 0; i < [[self DNA] count] ; i++) {
        if (random() % (100-i) < (percent - percentMutated)) {
            percentMutated++;
            NSString* currentVariant = [[self DNA] objectAtIndex:i];
            NSString* variant = currentVariant;
            while (variant == currentVariant) {
                variant = [NSString stringWithFormat:@"%c", [Cell returnRandomGene]];
            }
            [[self DNA] setObject:variant atIndexedSubscript:i];
            // for debug
            // NSLog(@"genome %i changed from %@ to %@", i, currentVariant, variant);
        }
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *Cell1 = [[Cell alloc] init];
        Cell *Cell2 = [[Cell alloc] init];
        NSLog(@"Distance before mutation: %i", [Cell1 hammingDistance:Cell2]);
        [Cell1 mutate:10];
        [Cell2 mutate:10];
        NSLog(@"Distance after 10%% mutation: %i", [Cell1 hammingDistance:Cell2]);
        [Cell1 mutate:50];
        [Cell2 mutate:50];
        NSLog(@"Distance after 50%% mutation: %i", [Cell1 hammingDistance:Cell2]);
    }
    return 0;
}

