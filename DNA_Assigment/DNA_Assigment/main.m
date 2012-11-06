//
//  main.m
//  DNA_Assigment
//
//  Created by INOKENTII GOLOVIN on 02.11.12.
//  Copyright (c) 2012 INOKENTII GOLOVIN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell (Mutator)
    -(void) mutate: (int) dPercent;
    -(NSString *) getRandomMutateIndex;
@end

@implementation Cell (Mutator)

    //get random_gene_index to change
    -(NSString *) getRandomMutateIndex {
        int index = arc4random_uniform(DNALength);
        NSString *sindex = [NSString string];
        sindex = [NSString stringWithFormat:@"%i", index];
        
        return sindex;
    }

    -(void) mutate:(int) dPercent {

        int toChange = dPercent*DNALength/100;
        NSMutableArray *changeIndex = [[NSMutableArray alloc] initWithCapacity:toChange];
        
        for(int i=0; i<toChange; i++){
            //get random_gene_index to change
            NSString *sindex = [self getRandomMutateIndex];
            BOOL goNext = false;
            
            while (!goNext) {
                //if element at index == sindex is not already changed - Change it
                if(![changeIndex containsObject:sindex]) {
                    NSString *newGene = [self getRandomGene];
                    [self.DNA replaceObjectAtIndex:sindex.intValue withObject:newGene];
                    
                    [changeIndex addObject:sindex];
                    goNext = true;
                } else {
                   //get new index to change
                   sindex = [self getRandomMutateIndex];
                }
            }
        }

    }

@end


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSLog(@"Karamba!");
        
        //Create and compare two DNAs
        Cell *cellObj1 = [[Cell alloc] init];
        Cell *cellObj2 = [[Cell alloc] init];
               
        int difference = [cellObj1 hammingDistance: cellObj2];
        if(difference >=0 ) NSLog(@" HammingDistance = %i",difference);
        else NSLog(@"DNAs have different lenght so they can't be compared");
        
        
        //Mutate and compare DNAs
        int mValue = 30; //%perecents to change in DNA structure
        [cellObj1 mutate:mValue];
        [cellObj2 mutate:mValue];
         NSLog(@"Mutation occurred");
        
        difference = [cellObj1 hammingDistance: cellObj2];
        if(difference >=0 ) NSLog(@" HammingDistance = %i",difference);
        else NSLog(@"DNAs have different lenght so they can't be compared");
       
    }
    return 0;
}
