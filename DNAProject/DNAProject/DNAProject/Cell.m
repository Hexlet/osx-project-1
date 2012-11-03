//
//  Cell.m
//  DNAProject
//
//  Created by Vitaly on 01.11.12.
//  Copyright (c) 2012 Vitaly Petrov. All rights reserved.
//

#import "Cell.h"
#include <stdlib.h>

const int ARRAY_COUNT = 100;

@implementation Cell

-(id) init {
    self = [super init];
    if (self) {
        _array = [[NSMutableArray alloc] init];
        for (int i=0; i<ARRAY_COUNT; i++) {
            int r = arc4random() % 100;
            if (r>=0 && r<25) {
                [_array addObject:@"A"];
            } else if(r>=25 && r<50){
                [_array addObject:@"T"];
            } else if(r>=50 && r<75) {
                [_array addObject:@"G"];
            } else if(r>=75 && r<100) {
                [_array addObject:@"C"];
            }
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)cell {
    int result = 0;
    if(cell.array.count <= ARRAY_COUNT){
        for (int i=0; i<ARRAY_COUNT; i++) {
            if(self.array[i]==cell.array[i]) {
                result++;
            }
        }
    } else {
        NSLog(@"Массив <= 100");
    }
    return result;
}

-(void) print {
    NSLog(@"Array count %li",[_array count]);
    for (int i=0; i<ARRAY_COUNT; i++) {
        NSLog(@"%@",_array[i]);
    }
}

@end
