//
//  Fraction.m
//  helloworld
//
//  Created by Volodia on 30.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
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

-(void) setTo:(int)numerator over:(int)denominator {
    _numerator = numerator;
    _denominator = denominator;
}

@end
