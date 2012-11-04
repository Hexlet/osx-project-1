//
//  Cell.m
//  DNA
//
//  Created by Vlad on 03.11.12.
//  Copyright (c) 2012 Vlad. All rights reserved.
//

#import "Cell.h"
#import "DNAElements.h"
#define NUMBER_OF_ELEMENTS 100

@implementation Cell
-(id) init
{
    self = [super init];
    if(self)
    {
        NSInteger initialArrayCapacity = NUMBER_OF_ELEMENTS;
        _DNA = [[NSMutableArray alloc] initWithCapacity:initialArrayCapacity];
        // Fill DNA chain
        for (int i = 0; i < initialArrayCapacity; i++) {
            int rangeOfDNAElements = (C + 1) - A;
            // Generate numbers form 1 to 4
            DNAElements dnaElement = (arc4random() % rangeOfDNAElements) + A;
            switch (dnaElement) {
                case A:
                    [_DNA addObject: @"A"];
                    break;
                case T:
                    [_DNA addObject: @"T"];
                    break;
                case G:
                    [_DNA addObject: @"G"];
                    break;
                case C:
                    [_DNA addObject: @"C"];
                    break;
                default:
                    [_DNA addObject: @"A"];
                    break;
            } //switch
        } //for
    } //if
    return self;
}

-(int) hammingDistance:(Cell *) anotherCell
{
    int hammingDistance = 0;
    if(anotherCell != nil){
        for (int i = 0; i < [_DNA count]; i++) {
            if(_DNA[i] != [anotherCell DNA][i])
            {
                hammingDistance++;
            } //if
        } //for
    } // if
    else {
        hammingDistance = -1;
    }
    return hammingDistance;
}

@end
