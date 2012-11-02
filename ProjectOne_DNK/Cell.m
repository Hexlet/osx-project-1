//
//  Cell.m
//  ProjectOne_DNK
//
//  Created by Максим on 30.10.12.
//  Copyright (c) 2012 CarelessApps. All rights reserved.
//

#import "Cell.h"


@implementation Cell

-(id)init{
    self = [super init];
    if (self) {
        _DNA = [NSMutableArray arrayWithCapacity:100];
        for (int i = 0; i <100; i++) {
            int letterIntValue;
            letterIntValue = arc4random() %4;
            if (letterIntValue == 0) {
                [_DNA addObject:@"A"];
            }
            else if (letterIntValue == 1) {
                [_DNA addObject:@"T"];
            }
            else if (letterIntValue == 2) {
                [_DNA addObject:@"G"];
            }
            else {
                [_DNA addObject:@"C"];
            }
        }
    }
    return self; 
}

-(int)hammingDistance: (id)cellObject{
    int i;
    for (i = 0; i<100; i++) {
        if ([[cellObject objectAtIndex:i] isEqualTo:[_DNA objectAtIndex:i]]){
        }
        else {
            _errorRows = _errorRows+1;
        }
    }
    NSLog(@"hamming distance %i",_errorRows);
    return _errorRows;
}


@end
