//
//  main.m
//  DNA Test
//
//  Created by Evgeny Golubev on 30.10.12.
//  Copyright (c) 2012 Evgeny Golubev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNACell.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        DNACell *DNA1, *DNA2;
        
        DNA1 = [[DNACell alloc] init];
        DNA2 = [[DNACell alloc] init];
        
        NSLog(@"Hamming Distance: %i",[DNA1 hammingDistance:DNA2]);
    }
    return 0;
}