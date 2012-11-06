//
//  main.m
//  osx-project-1
//
//  Created by Аня&Саша on 06.11.12.
//  Copyright (c) 2012 nogaav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void)mutate:(int)percent;
@end

@implementation Cell (mutator)

-(void)mutate:(int)percent{
    if((percent < 0)||(percent > 100)){
        NSLog(@"Value of percent must be in [0;100]");
        return;
    }
    long countEl = lroundf([self.DNA count]*percent/100);
//    percent /=100;
//    countEl *=percent;//quantity elements for change;
    BOOL checkReplace [[self.DNA count]];
    for(int i = 0; i < [self.DNA count]; i++)
        checkReplace[i] = YES;
    
    int count = 0;//counter of changed elements
    while (count < countEl) {
        int index = arc4random()%[self.DNA count];
        if(checkReplace[index]){
            checkReplace[index] = 0;
            [self.DNA insertObject:[self getRandomSymbol] atIndex:index];
        }
    }
        
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell_1 = [[Cell alloc] init];
        Cell *cell_2 = [[Cell alloc] init];
        
//        NSLog(@"Cell_1: %@", [cell_1 getString]);
//        NSLog(@"Cell_2: %@", [cell_2 getString]);
        
        NSLog(@"Hamming distance = %i", [cell_1 hammingDistance:cell_2]);
        
        [cell_1 mutate:50];
        
        NSLog(@"Hamming distance = %i", [cell_1 hammingDistance:cell_2]);

        
    }
    return 0;
}

