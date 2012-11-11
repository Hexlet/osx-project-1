//
//  Fraction.h
//  helloworld
//
//  Created by Volodia on 30.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

@property int numerator;
@property int denominator;

-(void) setTo : (int) numerator over : (int) denominator;
-(void) print;

@end
