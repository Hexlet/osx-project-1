//
//  main.m
//  project_one
//
//  Created by Roman Meshkevich on 02/11/2012.
//  Copyright (c) 2012 Roman Meshkevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell * human = [[Cell alloc] init];
        Cell * pig = [[Cell alloc] init];
        NSLog(@"%@",human);
        NSLog(@"%@",pig);
        NSLog(@"Difference = %i",[human hammingDistance:pig]);
//
        [pig mutate:100];
        [human mutate:100];
//
        NSLog(@"%@",human);
        NSLog(@"%@",pig);
        NSLog(@"Difference = %i",[human hammingDistance:pig]);
        
    }
    return 0;
}

