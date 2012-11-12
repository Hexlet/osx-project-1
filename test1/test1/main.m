//
//  main.m
//  test1
//
//  Created by Leonov on 10.11.12.
//  Copyright (c) 2012 Leonov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell (Mutator)
- (void) mutate: (int) x;
@end

@implementation Cell (mutator)
-(void) mutate: (int) proc{
    NSString *atgc = @"ATGC";

    for (int i = 0; i < 100; i = i + arc4random() % (100/proc)) {
        int newElement = arc4random() % [atgc length] ;
        [self.DNA replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%c",[atgc characterAtIndex:newElement]]];
    }
}
@end



int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        Cell *c1 = [[Cell alloc] init];
        Cell *c2 = [[Cell alloc] init];
        
        int rez1 = [c1 hammingDistance: c2];
        NSLog(@"Hd: %d", rez1);
        [c1 mutate:42];
        [c2 mutate:12];
        rez1 = [c1 hammingDistance: c2];
        NSLog(@"Hd: %d", rez1);
    }
    return 0;
}

