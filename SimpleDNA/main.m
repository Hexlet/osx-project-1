//
//  main.m
//  SimpleDNA
//
//  Created by sbogdanov on 03.11.12.
//  Copyright (c) 2012 sbogdanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)

-(void) mutate:(int)percent;
-(id)getRandomNucleotideExclude:(id)exclude;
@end


@implementation Cell (Mutator)

-(void)mutate:(int)percent{
    if(percent>100) {
        percent=100;
    } else if(percent<0){
        percent=0;
    }
    int countMutations =(([self.DNA count]/100.f)*percent);
    NSMutableArray* stackNucleotide = [[NSMutableArray alloc] initWithCapacity:10];
    NSMutableArray* stackPositionNucleotide = [[NSMutableArray alloc] initWithCapacity:10];
    for (NSInteger i=0;i<countMutations;i++){
        NSInteger positionMutateNucleotide = arc4random()%[self.DNA count];
        [stackNucleotide addObject:[self getRandomNucleotideExclude:[self.DNA objectAtIndex:positionMutateNucleotide]]];
        [stackPositionNucleotide addObject:[NSNumber numberWithInteger:positionMutateNucleotide]];
        [self.DNA removeObjectAtIndex:positionMutateNucleotide];
    }

    for (NSInteger i=countMutations;i>0;i--){
        id obj = [stackNucleotide objectAtIndex:(i-1)];
        NSInteger atIndex =[[stackPositionNucleotide objectAtIndex:(i-1)] integerValue];
        [self.DNA insertObject:obj atIndex: atIndex];
    }

   // NSLog(@"Finish mutate");
    
}
-(id)getRandomNucleotideExclude:(id)exclude{
    return [[NSString alloc] initWithFormat:@"%C",[[NUCLEOTIDES stringByReplacingOccurrencesOfString:exclude withString:@"" ] characterAtIndex: arc4random()%(NUCLEOTIDES.length-1)]];;
}

@end




int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell* mainCell = [[Cell alloc]init];
        Cell* forHammingCell =[[Cell alloc]init];
        NSLog(@"Haming distance: %i",[mainCell hammingDistance:forHammingCell]);
        [mainCell mutate:50];
        [forHammingCell mutate:50];
        NSLog(@"Haming distance after mutate: %i",[mainCell hammingDistance:forHammingCell]);
        
        
       /*
        my test:)
        int percentMutate=50;
        Cell* mainCell = [[Cell alloc] init];
        Cell* forHammingCell = [[Cell alloc] init];
        Cell* mainCellBeforeMutate = [[Cell alloc] init];
        mainCellBeforeMutate.DNA=[mainCell.DNA copy];
        //NSLog(@"Main DNA: %@",[mainCell.DNA componentsJoinedByString:@""]);
        //NSLog(@"Copy of Main DNA: %@",[mainCellBeforeMutate.DNA componentsJoinedByString:@""]);
        //NSLog(@"DNA for test hamming: %@",[forHammingCell.DNA componentsJoinedByString:@""]);
        NSLog(@"DNA length: %i", DNA_LENGTH);
        NSLog(@"Haming distance start calculate");
        //NSLog(@" test haming distance, result should be 0. result = %i",[mainCell hammingDistance:mainCell]);
        NSLog(@"Haming distance: %i",[mainCell hammingDistance:forHammingCell]);
        NSLog(@"Start mutate %i%%",percentMutate);
        [mainCell mutate:percentMutate];
        //NSLog(@"Main DNA mutated: %@",[mainCell.DNA componentsJoinedByString:@""]);
        NSLog(@"Hamming distance after muate:%i",[mainCellBeforeMutate hammingDistance:mainCell]);*/
    }
    return 0;
}

