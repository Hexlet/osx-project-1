//
//  main.m
//  DNAproj
//
//  Created by Иван Иванов on 10.11.12.
//  Copyright (c) 2012 Иван Иванов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void)mutate:(int)n;
@end

@implementation Cell (mutator)
-(void)mutate:(int)percent{
    
    if (percent>=0 && percent<=100) {
        int randomIndex;
        
        NSMutableArray *insertElementsArray = [[NSMutableArray alloc] initWithCapacity:4];
        [self.dnaInsertMask setArray:self.dna];
        
        for (int i =0; i<100/100*percent; i++) {
            randomIndex = arc4random()%100;
            if ([self.dnaInsertMask objectAtIndex:randomIndex] != @"x") {
                
                [insertElementsArray setArray: self.dnaElements];
                [insertElementsArray removeObject: [[self dna] objectAtIndex:randomIndex ] ];
                [[self dna] replaceObjectAtIndex:randomIndex withObject:  [insertElementsArray  objectAtIndex: arc4random()%3]];
                [self.dnaInsertMask replaceObjectAtIndex:randomIndex withObject:@"x"];
                
                
            }else {i--;}
            
        }

    }
    
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
    
        Cell *myCell1, *myCell2;
        
        myCell1 = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
        
        [myCell1 printDna];
        [myCell2 printDna];
        
        NSLog(@"Hamming distance: %d", [myCell1 hammingDistance:myCell2]);
        
        [myCell1 mutate:-3];
        [myCell2 mutate:101];
        
        NSLog(@"Hamming distance: %d", [myCell1 hammingDistance:myCell2]);
        
    }
    return 0;
}

