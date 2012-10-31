//
//  main.m
//  DNAProject
//
//  Created by Andrew on 30.10.12.
//  Copyright (c) 2012 AndrewVanyurin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
- (void)mutate:(int) percentM;
@end

@implementation Cell (mutator)
- (void)mutate:(int) percentM{
    if ((percentM < 0) || (percentM >100)) {
        NSException *e = [NSException exceptionWithName:@"WrongNumberPercent" reason:@"Wrong Number Percent" userInfo:nil];
        @throw e;
    }
    else{        
        //Если я не делаю mutableCopy, то метод replaceObjectAtIndex:withObject: не доступен 8-(
        NSMutableArray *mmm = [[self DNA] mutableCopy];
        
        for (int i = 1 ; i <= percentM; i++) {
            int index1 = arc4random()%[[self DNA] count];
            int index2 = arc4random()%[ATGC count];
            while ([[mmm objectAtIndex:index1] isEqual: [ATGC objectAtIndex:index2]]) {
                index2 = arc4random()%[ATGC count];
            }
            [mmm replaceObjectAtIndex:index1 withObject:[ATGC objectAtIndex:index2]];
        }
        
        [self setDNA: mmm];
    }
}
@end



int main(int argc, const char * argv[])
{

    @autoreleasepool {
       
        Cell *c1 = [[Cell alloc] init];
        Cell *c2 = [[Cell alloc] init];
        
        NSLog(@"#1 = %i", [c1 hammingDistance:c2]);

        [c1 mutate:10];
        
        NSLog(@"#2 = %i", [c1 hammingDistance:c2]);
    }
    return 0;
}

