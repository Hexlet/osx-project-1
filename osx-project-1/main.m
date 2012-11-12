//
//  main.m
//  DNA
//
//  Created by Mac on 11/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, DNA!");
        
        //---Create 2 Cells---
        Cell *myCell1 = [[Cell alloc]init];
        Cell *myCell2 = [[Cell alloc]init];
        
        //--Compare cells, mutate and compare again.
        [myCell1 hammingDistanceWithCell:myCell2];
        [myCell1 mutateDNA:5];
        [myCell2 mutateDNA:5];
        [myCell1 hammingDistanceWithCell:myCell2];
    }
    return 0;
}

