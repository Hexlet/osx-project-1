//
//  main.m
//  DNAProject
//
//  Created by test on 05.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+Mutate.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *Cell1,*Cell2;
        
        Cell1 = [[Cell alloc] init];
        Cell2 = [[Cell alloc] init];
        
        NSLog(@"Distance %i", [Cell2 hammingDistance: Cell1] );
        [Cell2 Mutate: 10];
        [Cell1 Mutate: 10];
        NSLog(@"New distance %i", [Cell2 hammingDistance: Cell1] );
        
    }
    return 0;
}

