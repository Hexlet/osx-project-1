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
        _DNASize = 100;
        _Symbols = [[NSArray alloc] initWithObjects: @"A", @"T", @"G", @"C", nil];
        
        _DNA = [[NSMutableArray alloc] initWithCapacity:self.DNASize];

        for(i=0; i<self.DNASize; i++){
            r = arc4random() % self.Symbols.count;
            _DNA[i] = self.Symbols[r];
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

-(NSString*) toNSString {
    int i;
    NSMutableString *str = [[NSMutableString alloc] init];
    for(i=0; i<self.DNASize; i++){
        [str  appendString:self.DNA[i]];
    }
    return str;
}

@end
