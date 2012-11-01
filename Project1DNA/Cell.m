//
//  Cell.m
//  Project1DNA
//
//  Created by TT on 31.10.12.
//  Copyright (c) 2012 TT. All rights reserved.
//

#import "Cell.h"


@implementation Cell
@synthesize DNA = _DNA;

-(void) dealloc 
{
    [_DNA release];
    [DNALiterals release];
    [super dealloc];
}

-(id) init 
{
    if(self = [super init]){
        _DNA = [[NSMutableArray alloc] init];
        DNALiterals = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C",nil];
        for(int i = 0; i < 100; i++){
            [_DNA addObject:[DNALiterals objectAtIndex:arc4random() % 4]];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)cell
{
    int retVal = 0, counter = 0;
    for (NSString *type in _DNA){
        if(![type isEqualToString: [[cell DNA] objectAtIndex:counter++]]){
            retVal++;
        }
    }
    return retVal;
}

@end
