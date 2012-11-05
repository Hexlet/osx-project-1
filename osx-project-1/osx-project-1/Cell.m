//
//  Cell.m
//  osx-project-1
//
//  Created by Mikhail on 02.11.12.
//  Copyright (c) 2012 Mikhail. All rights reserved.
//

#import "Cell.h"




@implementation Cell

@synthesize DNA;


-(id) init
{
    self = [super init];
    if (self) {
        DNA = [[NSMutableArray alloc] initWithCapacity: 100];
        for (int i = 0; i<100; ++i) {
            [DNA addObject:[MyChar CharWithValue:[Cell randNucleotide]]];
        }
    }
    return self;
}

+(char) randNucleotide
{
    switch (arc4random() % 4) {
        case 0:
            return 'A';
        case 1:
            return 'T';
        case 2:
            return 'G';
        default:
            return 'C';
    }
}

-(int) hammingDistance:(Cell *)cell
{
    int errorCount = 0;

    for (int i = 0; i < MIN([self.DNA count], [cell.DNA count]); i++) {
        MyChar * this = [self.DNA objectAtIndex:i];
        MyChar * that = [cell.DNA objectAtIndex:i];
        
//        NSLog(@"%c  %c", this.value, that.value);
        
        if (this.value!= that.value) {
            errorCount ++;
        }
    }
    
    return errorCount;
}

@end
