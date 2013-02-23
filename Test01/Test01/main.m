//
//  main.m
//  Test01
//
//  Created by apro on 16.02.13.
//  Copyright (c) 2013 apro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"


@interface Fraction () {
    NSString *name;
}
-(void)add: (Fraction *)f;
@end;


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Fraction *myFraction, *myFraction2;
        myFraction = [[Fraction alloc] init];
        myFraction2 = [[Fraction alloc] init];
        
        [myFraction setNumerator:1];
        [myFraction setDenominator:4];
        
        [myFraction2 setNumerator:1];
        [myFraction2 setDenominator:6];
        
        [myFraction add:myFraction2];

        [myFraction print];
    }
    return 0;
}

