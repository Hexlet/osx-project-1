//
//  DNA.m
//  DNA
//
//  Created by Artem Abramov on 11/13/12.
//  Copyright (c) 2012 Artem Abramov. All rights reserved.
//

#import "DNA.h"

@implementation DNA

@synthesize molecules = _molecules;


-(NSMutableArray *)molecules {
    if (!_molecules)
        _molecules = [[NSMutableArray alloc] init];
    return _molecules;
}

-(id)init
{
    NSArray * types = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    
    self = [super init];
    
    if (self) {
        //[[_molecules alloc] init];
        for (int i = 0; i < 100; ++i)
        {
            NSString *rndType = [types objectAtIndex:(rand() % types.count)];
            [self.molecules addObject:rndType];
            NSLog(@"Inserted a string %@ at index %i", rndType, i);
        }
    }
    
    return self;
}

-(int)hammingDistance: (DNA *) compareDNA
{
    NSUInteger result = 0, length;
    
    if (compareDNA.molecules.count == 0) {
        return -1; /* Op-pa, C-style. How to treat errors in obj-c? */
    }
    
    if (self.molecules.count > compareDNA.molecules.count) {
        length = compareDNA.molecules.count;
    }
    else {
        length = self.molecules.count;
    }
    
    for (NSUInteger i = 0; i < length; i++) {
        if (![[compareDNA.molecules objectAtIndex:i] compare:[self.molecules objectAtIndex:i]]) {
            result++;
        }
    }
    
    return (int)result;
}

@end
