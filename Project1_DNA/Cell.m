//
//  Cell.m
//  Project1_DNA
//
//  Created by Alexander on 06.11.12.
//  Copyright (c) 2012 Alexander. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize DNA = _DNA;
-(id)init
{
    self = [super init];
    if (self) {
        self.DNA = [[NSMutableArray alloc]init];
        variety = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C",nil];
        for (int i = 0; i < countDNA; i++) {
            @autoreleasepool {
                [self.DNA addObject:[variety objectAtIndex:arc4random()%[variety count]]];
            }
        }
    }

    return self;
}

-(int)hammingDistance:(Cell*)cell
{
    int hammingDist = 0;
    for (int i = 0; i < countDNA; i++)
        if ([self.DNA objectAtIndex:i] != [cell.DNA objectAtIndex:i])
            hammingDist++;
    
    return hammingDist;
}
@end