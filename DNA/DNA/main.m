//
//  main.m
//  DNA
//
//  Created by Artem Abramov on 11/13/12.
//  Copyright (c) 2012 Artem Abramov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DNA.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        DNA * firstCell = [[DNA alloc]init];
        DNA * secondCell = [[DNA alloc]init];
        
        NSLog(@"%i", [firstCell hammingDistance:secondCell]);
        
    }
    return 0;
}

