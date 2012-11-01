//
//  main.m
//  Project1
//
//  Created by brevis on 10/31/12.
//  Copyright (c) 2012 brevis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
                
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"Distance before mutation: %d", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:arc4random()%101];
        [cell2 mutate:arc4random()%101];
        
        NSLog(@"Distance after mutation: %d", [cell1 hammingDistance:cell2]);
    }
    
    return 0;
}

