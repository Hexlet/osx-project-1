//
//  Cell.m
//  DNA
//
//  Created by Admin on 11/2/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import "Cell.h"
#import <stdlib.h>

@implementation Cell

-(id) init {
    int i, r;
    
    self = [super init];
    
    if(self){
        _DNA = [[NSMutableArray alloc] init];

        for(i=0; i<100; i++){
            r = arc4random() % 4;
            switch(r){
                case 0:
                    [_DNA addObject: @'A'];
                    break;
                case 1:
                    [_DNA addObject: @'T'];
                    break;
                case 2:
                    [_DNA addObject: @'G'];
                    break;
                case 3:
                    [_DNA addObject: @'C'];
                    break;
            }
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)c {
    int i, d = 0;
    for(i=0; i<_DNA.count; i++){
        if(c.DNA[i] != _DNA[i])
            d++;
    }
    return d;
}

@end
