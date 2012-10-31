//
//  CellMutator.m
//  osx-1
//
//  Created by Александр Турченко on 31.10.12.
//  Copyright (c) 2012 TurchenkoAlex. All rights reserved.
//

#import "CellMutator.h"
#import "DNA.h"

@implementation Cell (mutator)

-(NSString *)mutateDNAElement:(NSString *)theElement{
    int randomShift = random() % DNALength;
    if ([theElement isEqual:DNATypes[randomShift]]){
        randomShift = (randomShift + 1) % DNALength;
    }
    return DNATypes[randomShift];
}

-(void)mutateDNAWithPercentage:(int)thePercentage{
    NSUInteger length = [[self DNA] count];
    NSUInteger mutationCount = ((length / 100) * thePercentage);
    if (mutationCount > length) {
        mutationCount = length;
    }

    BOOL mutation[length];
    
    for(NSUInteger i = 0; i < length; ++i){
        mutation[i] = NO;
    }
    
    for(NSUInteger i = 0; i < mutationCount; ++i){
        NSUInteger randomIndex = random() % length;
        BOOL setted = NO;
        while(!setted){
            if(mutation[randomIndex]){
                randomIndex = (randomIndex + 1) % length;
            } else {
                mutation[randomIndex] = YES;
                setted = YES;
            }
        }
    }
    for(NSUInteger i = 0; i < length; ++i){
        if(mutation[i]){
            [[self DNA] replaceObjectAtIndex:i withObject:[self mutateDNAElement:[self DNA][i]]];
        }
    }
}
@end

