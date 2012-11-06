//
//  main.m
//  osx-project-1
//
//  Created by Pavel Popchikovsky on 11/4/12.
//  Copyright (c) 2012 Pavel Popchikovsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell* cell01 = [[Cell alloc] init];
        Cell* cell02 = [[Cell alloc] init];
                
        NSLog(@"%i", [cell01 hammingDistance:cell02]);
        
        [cell01 mutate:50];
        [cell02 mutate:50];
                
        NSLog(@"%i", [cell01 hammingDistance:cell02]);
        
    }
    
    return 0;
}
