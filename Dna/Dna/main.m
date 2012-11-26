//
//  main.m
//  Dna
//
//  Created by conference on 22.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell(Mutator) 

-(void)mutate:(int)percents;

@end

@implementation Cell(Mutator)

-(void)mutate:(int)percents {
    if (percents <= 100) {
        int countReplaces = 0;
        for (int i = 0; i < [dnaArray count]; i++) {
            maskArray[i] = NO;
        }
        while (countReplaces < percents) {
            int percRandInt = (int)(random() % 100);
            int randInt = (int)(random() % 4);
            NSString *string = [[NSString alloc] initWithFormat: [dnaBitsArray objectAtIndex:randInt]];
            NSString *string2 = [[NSString alloc] initWithFormat: [dnaArray objectAtIndex:percRandInt]];
        
            if ((maskArray[percRandInt] == NO) && (string != string2)) {
                maskArray [percRandInt] = YES;
                [dnaArray replaceObjectAtIndex:percRandInt withObject:string];
                countReplaces++;
            }
        }
    }
}

@end


int main (int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *myCell, *myCell2;
        myCell = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
        NSLog(@"Hamming distance before mutation:         %d", [myCell hammingDistance:myCell2]);
        [myCell mutate:70];
        NSLog(@"Hamming distance after mutation 1st cell: %d", [myCell hammingDistance:myCell2]);
        [myCell2 mutate:5];
        NSLog(@"Hamming distance after mutation 2nd cell: %d", [myCell hammingDistance:myCell2]);
    }
    return 0;
}

