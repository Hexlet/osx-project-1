//
//  main.m
//  DNANickToverovskiy
//
//  Created by Nick Toverovskiy on 30.10.12.
//  Copyright (c) 2012 Nick Toverovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface  Cell (Mutator)
- (void) mutate:(int)percent;
@end

@implementation Cell (Mutator)

- (void) mutate:(int)percent {
    
    NSLog(@"Mutating by %d%%", percent);
    
    //Check input.
    if (percent > 100) {
        percent = 100;
    }
    
    if (percent < 0) {
        percent = 0;
    }
    
    //An array to store indexes of mutated nucleobases.
    NSMutableDictionary *mutatedIndexes = [NSMutableDictionary dictionary];
    //NSMutableArray *mutatedIndexes = [NSMutableArray array];
    
    int randomIndex = -1;
    NSString *randomIndexAsString = @"";
    
    bool wasMutated = false;
    int lookForMutatedCount = 0;
    
    int tempInt = 0;
    
    for (int i=0; i<percent; i++) {
        
        //Get random index to mutate.
        randomIndex = arc4random()%[self.dna count];
        
        wasMutated = true;
        
        if (lookForMutatedCount == [self.dna count]) {
            break;
        }
        lookForMutatedCount = 0;
        
        //This cicle will run until it mutates a previously unmutated nucleobase.
        //If randomly taken nucleobase will apear to be mutated, that algorithm seeks incrementaly for next unmutated nucleobase.
        //If all 100% nucleobases will be mutated, it will stop.
        while (wasMutated) {
            
            //Convert index to string. String will store mutated indexes. Haven't figure out a better way to store those indexes.
            randomIndexAsString = [NSString stringWithFormat:@"%d", randomIndex];
            
            //Check if nucleobase at index was previously mutated.
            wasMutated = ([mutatedIndexes valueForKey:randomIndexAsString] != nil);
            
            //If wasn't mutated, than...
            if (!wasMutated) {
                
                //Mutate!
                NSString *oldNucleobase = [NSString stringWithString:[self.dna objectAtIndex:randomIndex]];


                self.dna[randomIndex] = [self getRandomNucleobaseChar];

                NSLog(@"Mutated %d.\t№%d\t%@ → %@", lookForMutatedCount + 1, randomIndex, oldNucleobase, [self.dna objectAtIndex:randomIndex]);
                //Remember that nucleobase at index was mutated.
                [mutatedIndexes setObject:@"Mutated" forKey:randomIndexAsString];
                
                
            } else {
                 //Just for logging.
                tempInt = randomIndex;
                
                //Looks like nucleobase has already been mutated.
                //Increment nucleobase index to try again on next loop.
                randomIndex = randomIndex + 1;
                
                NSLog(@"Incrementing index %d → %d", tempInt, randomIndex);
                
                //Protect from out of bouds.
                if (randomIndex >= [self.dna count]) {
                    randomIndex = 0;
                    NSLog(@"Bounds protection.");
                }
                
            }
            
            //If all nucleobases were mutated, than stop.
            lookForMutatedCount = lookForMutatedCount + 1;
            if (lookForMutatedCount == self.dna.count) {
                NSLog(@"All %d nucleobases mutated. Breaking.", lookForMutatedCount);
                break;
            }
        }
        
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //Define two cells.
        Cell *cell1, *cell2;
        
        int firstDistance = 0;
        int secondDistance = 0;
    
        //Create to cells.
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        //Output cells hamming distance.
        firstDistance = [cell1 hammingDistance:cell2];
        NSLog(@"Hamming distance: %d", firstDistance);
        NSLog(@"   ");
        
        //Mutate cells.
        [cell1 mutate: 10];
        
        NSLog(@"   ");
        
        [cell2 mutate: 20];
        
        NSLog(@"   ");
        
        //Output new cells huming distance.
        secondDistance = [cell1 hammingDistance:cell2];
        NSLog(@"Hamming distance after mutation: %d", secondDistance);
        
        NSLog(@"   ");
        NSLog(@"Total:");
        NSLog(@"Before mutation\t%d", firstDistance);
        NSLog(@"After mutation\t%d", secondDistance);
        NSLog(@"Difference\t\t%d", firstDistance - secondDistance);
     
    }
    return 0;
}

