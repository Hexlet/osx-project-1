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
        NSArray *ATGC = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        NSMutableArray *mmm = [[self DNA] mutableCopy];
        for (int i = 1 ; i <= percentM; i++) {
            [mmm replaceObjectAtIndex:(arc4random()%[[self DNA] count]) withObject:[ATGC objectAtIndex:(arc4random()%[ATGC count])]];
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
        
        NSLog(@"#1 difernce number = %i", [c1 hammingDistance:c2]);

        [c1 mutate:10];
        
        NSLog(@"#2 difernce number = %i", [c1 hammingDistance:c2]);

    }
    return 0;
}

