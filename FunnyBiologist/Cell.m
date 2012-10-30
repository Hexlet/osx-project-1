//
//  Cell.m
//  FunnyBiologist
//
//  Created by Paul Dmitryev on 30.10.12.
//  Copyright (c) 2012 Paul Dmitryev. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    if (self) {
        _DNA = [[NSMutableArray alloc] init];
        
        for (int i=0; i<DNA_SIZE; i++) {
            [_DNA addObject: [Cell getRandomDNA]];
        }
    }
    return self;
}

+(NSString*)getRandomDNA {
    NSArray* symbols = @[@"A", @"T", @"G", @"C"];
    NSUInteger randKey = arc4random() % [symbols count];
    return symbols[randKey];
}

-(int)hammingDistance:(Cell*) other {
    int result = 0;
    for (int i=0; i<DNA_SIZE; i++) {
        if (self.DNA[i]!=other.DNA[i]) {
            result++;
        }
    }
    return result;
}


-(void)print{
    NSLog(@"%@", _DNA);
}

@end
