//
//  main.m
//  DNA
//
//  Created by Dastar Ron on 10/31/12.
//  Copyright (c) 2012 Dastar Ron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void) mutate: (int)percent;
-(NSString *) chooseLetterExept: (NSString *)this;
@end

@implementation Cell (mutator)

-(NSString *) chooseLetterExept:(NSString *)this {
    //A,T,G,C
    NSString *thisLetter = [[NSString alloc] init];
    NSMutableArray *arrayOfLetters = [[NSMutableArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
    [arrayOfLetters removeObject:this];
    int point = (1 + arc4random() % 3) - 1;
    thisLetter = [arrayOfLetters objectAtIndex:point];
    return thisLetter;
}

-(void) mutate: (int)percent{
    //Protection from idiots
    if (percent > 0) {
        if (percent > 100)
            percent = 100;
        //Copy of original DNA to check if mutate was successed
        NSMutableArray *countOfChangedArrays = [[NSMutableArray alloc] init];
        int point;
        for (int i = 0; i < percent; i++) {
            point = (1 + arc4random() % (100) - 1);
            if (![countOfChangedArrays containsObject:[NSNumber numberWithInteger:point]]) {
                [countOfChangedArrays addObject:[NSNumber numberWithInteger:point]];
                [[self getDNA] replaceObjectAtIndex:point withObject:[self chooseLetterExept:[[self getDNA] objectAtIndex:point]]];
            } else {
                i--;
            }
        }
        
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *DNA = [[Cell alloc] init];        
        Cell *newDNA = [[Cell alloc] init];
        int hamming = [DNA hammingDistance:newDNA];
        NSLog(@"%i",hamming);
        
        [DNA mutate:100];
        [newDNA mutate:100];
        hamming = [DNA hammingDistance:newDNA];
        NSLog(@"%i",hamming);
    }
    return 0;
}

