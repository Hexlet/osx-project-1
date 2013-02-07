//
//  main.m
//  osx-project-1
//
//  Created by Andrey Shindarev on 07.02.13.
//  Copyright (c) 2013 Andrey Shindarev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Cell *cell = [[Cell alloc] init];
        Cell *cell1 = [[Cell alloc] init];
        NSLog(@"%i", [cell hammingDistance:cell1] );
        [cell mutation: 100];
        NSLog(@"%i", [cell hammingDistance:cell1] );
        
    }
    return 0;
}

