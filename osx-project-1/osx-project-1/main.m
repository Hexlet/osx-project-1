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
    long countEl = lroundf([self.DNA count]*percent/100);// quantity of DNA's elements for change
    BOOL checkReplace [[self.DNA count]]; //auxilary array for check of visited elementss
    for(int i = 0; i < [self.DNA count]; i++)
        checkReplace[i] = YES;
    
    int count = 0;//counter of changed elements
    while (count < countEl) {
        int index = arc4random()%[self.DNA count]; //generate random index of DNA's element
        NSString *el = [self getRandomSymbol];     //generate random symbol for this element
        if(checkReplace[index] && ([self.DNA objectAtIndex:index] != el)){ //check new generated element
            checkReplace[index] = NO;
            count++;
            [DNA replaceObjectAtIndex:index withObject:el];
        }
    }
        
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell_1 = [[Cell alloc] init];
        Cell *cell_2 = [[Cell alloc] init];
        
        NSLog(@"Cell_1: %@\n", cell_1);
        NSLog(@"Cell_2: %@\n", cell_2);
        
        NSLog(@"Hamming distance = %i", [cell_1 hammingDistance:cell_2]);
        
        int mutateEl = arc4random()%[[cell_1 DNA] count];
        [cell_1 mutate:mutateEl];
        NSLog(@"In Cell_1 was mutate %i percent of chain.\n", mutateEl);
        
        mutateEl = arc4random()%[[cell_2 DNA] count];
        [cell_2 mutate:mutateEl];
        NSLog(@"In Cell_2 was mutate %i percent of chain.\n", mutateEl);
                
        NSLog(@"New Cell_1: %@", cell_1);
        NSLog(@"New Cell_2: %@", cell_2);      
        NSLog(@"Hamming distance = %i", [cell_1 hammingDistance:cell_2]);

        
    }
    return 0;
}

