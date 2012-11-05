//
//  main.m
//  Cell
//
//  Created by Игорь Алюшев on 30.10.12.
//  Copyright (c) 2012 Игорь Алюшев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+mutator.h"




int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1=[[Cell alloc] init];
        Cell *cell2=[[Cell alloc]init];
        NSLog(@"hamming distance is %d",[cell1 hammingDistance:cell2]);
        
        [cell1 mutator:5];
        [cell2 mutator:32];
        
        NSLog(@"hamming distance after mutation is %d",[cell1 hammingDistance:cell2]);
    }
    return 0;
}

