//
//  main.m
//  DNA
//
//  Created by Alexander on 11/3/12.
//  Copyright (c) 2012 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void) mutate:(int) nnn;
@end

@implementation Cell (mutator)
-(void) mutate:(int)nnn {
    
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1=[[Cell alloc] init];
        Cell *cell2=[[Cell alloc] init];
        NSLog(@"%d",[cell1 hammingDistance:cell2]);
        [cell1 mutate:50];
        [cell2 mutate:50];
        NSLog(@"%d",[cell1 hammingDistance:cell2]);
    }
    return 0;
}

