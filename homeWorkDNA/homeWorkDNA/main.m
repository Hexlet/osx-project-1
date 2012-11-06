//
//  main.m
//  homeWorkDNA
//
//  Created by Mac on 04.11.12.
//  Copyright (c) 2012 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell(Mutator)

    -(void) mutator: (int)x;

@end

@implementation Cell(Mutator)

    -(void) mutator: (int)x{
        NSString *x1;
        NSUInteger x2, x3, x4;
        bool exNum = YES;
        
        NSMutableArray * indexes = [NSMutableArray arrayWithCapacity:(NSUInteger)x];
        for(int i = 0; i < x; i++) {
            do
            {
                x1 = [NSString stringWithFormat:@"%i" ,arc4random() % x];
                if(![indexes containsObject:x1]) {
                    [ indexes addObject:x1];
                    exNum = NO;
                }
                    
            }while(exNum);
            
            x2 = [ x1 integerValue];
            x3 = [self->elDna indexOfObject:[self->dna objectAtIndex:x2]];
            
            do {
                x4 = arc4random() % 4;
            } while (x4 == x3);
            
            [self->dna replaceObjectAtIndex:x2 withObject:[self->elDna objectAtIndex:x4]];
            
        }
        
    }

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *dCell, *tCell;
        
        dCell =[[Cell alloc] init];
        tCell =[[Cell alloc] init];
        
        
        int hm = [dCell hammingDistance:tCell];
        NSLog(@"Hamming distance - %i", hm);
        
        [dCell mutator:50];
        [tCell mutator:55];
        
        int hm2 = [dCell hammingDistance:tCell];
        NSLog(@"Hamming distance after mut - %i", hm2);
        
        
    }
    return 0;
}

