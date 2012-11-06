//
//  main.m
//  DNA1
//
//  Created by Dmitry on 11/3/12.
//  Copyright (c) 2012 TechAid Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        NSLog(@"Cell 1 DNA:");
        [cell1 printDNA];
        
        
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"Cell 2 DNA:");
        [cell2 printDNA];
        
        NSLog(@"hummingDistanse:%i", [cell1 hummingDistance:cell2]);
        
        [cell1 mutate:30];
        NSLog(@"Cell 1, after mutation:");
        [cell1 printDNA];
        
        [cell2 mutate:30];
        [cell2 printDNA];
        
        NSLog(@"After mutation hummingDistanse:%i", [cell1 hummingDistance:cell2]);

    }
    return 0;
}

