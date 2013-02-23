//
//  Fraction.m
//  Test01
//
//  Created by apro on 16.02.13.
//  Copyright (c) 2013 apro. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

-(id) init {
    self = [super init];
    if (self) {
        _denominator = 1;
    }
    return self;
}

-(void) print {
    NSLog(@"%i/%i", _numerator, _denominator);
}

-(void) add: (Fraction *)f {
    [self setNumerator: self.numerator * f.denominator + self.denominator * f.numerator];
    [self setDenominator: self.denominator * f.denominator];
}


@end
