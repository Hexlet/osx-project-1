//
//  main.m
//  DNA
//
//  Created by Администратор on 11/6/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+mutate.h"

int main()
{
    @autoreleasepool {
        
        Cell *DNA = [[Cell alloc] init];
        Cell *DNA2 = [[Cell alloc] init];
        
        NSLog(@"\n%@\n%@", DNA, DNA2);
        
        NSLog(@"HD1 = %d", [DNA hammingDistance:DNA2]);
        
        [DNA mutate:5];
        [DNA2 mutate:0];
        
        NSLog(@"HD2 = %d", [DNA hammingDistance:DNA2]);
        
        NSLog(@"\n%@\n%@", DNA, DNA2);
    }
    return 0;
}
