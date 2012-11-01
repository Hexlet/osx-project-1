//
//  Cell+mutator.m
//  Project1DNA
//
//  Created by TT on 01.11.12.
//  Copyright (c) 2012 TT. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

-(void) mutate:(int)percent
{
    NSMutableDictionary *mutantCells = [NSMutableDictionary dictionary];
    BOOL tryAgain;
    int i;
    for(i = 0; i < percent; i++){
        NSNumber *random = [NSNumber numberWithInt: arc4random() % 100];
        tryAgain = YES;
        while(tryAgain) {
            if([mutantCells objectForKey:random]){
                int value = [random intValue];
                random = [NSNumber numberWithInt:(value+1)%100];
            } else {
                [mutantCells setObject:[NSNumber numberWithBool:YES] forKey:random];
                tryAgain = NO;
            }
        }
    }
    
    for (i = 0; i < 100; i++){
        NSNumber *random = [NSNumber numberWithInt:i];
        if([mutantCells objectForKey:random]){
            [[self DNA] replaceObjectAtIndex:[random intValue] withObject:[self mutateSingleDNA:[[self DNA] objectAtIndex:[random intValue]]]];
        }
    }
}

-(NSString*) mutateSingleDNA:(NSString *) dna{
    int random = arc4random() % 4;
    if([[DNALiterals objectAtIndex:random] isEqualToString:dna]){
        return [DNALiterals objectAtIndex:(random+1)%4];
    }
    return [DNALiterals objectAtIndex:random];
}

@end
