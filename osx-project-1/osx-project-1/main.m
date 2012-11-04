//
//  main.m
//  osx-project-1
//
//  Created by Sergey Kondratyev on 01.11.12.
//  Copyright (c) 2012 Sergey Kondratyev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *myCell1 = [[Cell alloc]init];
        Cell *myCell2 = [[Cell alloc]init];
        
        int result = [myCell1 hammingDistance:myCell2];
        NSLog(@"%d",result);
    
        [myCell1 mutate:30];
        [myCell2 mutate:32];
        
        result = [myCell1 hammingDistance:myCell2];
        NSLog(@"%d",result);
    }
    return 0;
}

