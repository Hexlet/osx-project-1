//
//  main.m
//  DNA
//
//  Created by Arthur Belous on 05.11.12.
//  Copyright (c) 2012 Arthur Belous. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
- (void) mutate: (int) x;
@end

@implementation Cell (mutator)
-(void) mutate: (int) proc{
    NSString *letters = @"ATGC";
    
    for (int i = 0; i < 100; i = i + arc4random() % (100/proc)) {
        int newElement = arc4random() % [letters length] ;
        [self.DNA replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%c",[letters characterAtIndex:newElement]]];
    }
}
@end
int main(int argc, const char * argv[])
{
    @autoreleasepool {
<<<<<<< HEAD
        
        Cell *runCell = [[Cell alloc] init];
        [runCell init];
        [runCell hammingDistance:DNA]; // I do cknow is it right !?
        
       
    }
=======
        Cell *runCell1 = [[Cell alloc] init];
        Cell *runCell2 = [[Cell alloc] init];
        int mismatchCount =[runCell1 hammingDistance:runCell2];
        //NSLog(@"%d", mismatchCount);
        [runCell1 mutate:50];
        [runCell2 mutate:20];
        mismatchCount = [runCell1 hammingDistance: runCell2];
}
>>>>>>> FINAL
    return 0;
} 

