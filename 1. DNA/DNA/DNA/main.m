//
//  main.m
//  DNA
//
//  Created by Elena Grasovskaya on 12/24/12.
//  Copyright (c) 2012 Sergey Grasovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        cell1.name = @"DNA-1";
        cell2.name = @"DNA-2";
        
        NSLog(@"Distance: %i",[cell2 hammingDistance:cell1]);
        
        [cell1 mutatorAtProcent:78];
        [cell2 mutatorAtProcent:57];
        
        NSLog(@"Distance: %i",[cell2 hammingDistance:cell1]);
                
    }
    return 0;
}

