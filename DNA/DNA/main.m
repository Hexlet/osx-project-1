//
//  main.m
//  DNA
//
//  Created by Ihor Bodnar on 11/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  "Cell.h"

@interface Cell(mutator)
-(void) mutate: (int)pcnt2Mutate;
@end

@implementation Cell(mutator)

-(void) mutate:(int)pcnt2Mutate {
    int cnt2Mutate = pcnt2Mutate % 100;
    int i;
    
    for (i = 0; i < cnt2Mutate; i++) {
        [self.dna replaceObjectAtIndex:(i) withObject:([self.aAvailableSymbols objectAtIndex:(2)])];
    }
}

@end

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1, *cell2;
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        NSLog(@"%@", cell1);
        NSLog(@"%d", [cell1 hammingDistance:(cell2)]);
        
        [cell1 mutate:(10)];
        [cell2 mutate:(10)];

        NSLog(@"%d", [cell1 hammingDistance:(cell2)]);
    }

    return 0;
}

