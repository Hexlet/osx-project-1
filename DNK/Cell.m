//
//  Cell.m
//  DNK
//
//  Created by p.naumov on 01.11.12.
//  Copyright (c) 2012 p.naumov. All rights reserved.
//

#import "Cell.h"

const NSUInteger DNA_LENGTH = 100;

@implementation Cell
@synthesize DNA;

-(id) init {
    
    self = [super init];  
    
    if (self) {
        
        DNA = [NSMutableArray arrayWithCapacity:DNA_LENGTH];
        
        for (int i = 0; i < DNA_LENGTH; i++) {

            [DNA addObject:[Cell randomElement]];
        }
    }
    return self;
}


+(NSString*) randomElement {
    
    NSArray *const genes = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    return genes[arc4random() % genes.count];
    
}


-(int) hammingDistance:(Cell *)cell {
    int count = 0;
    
    
for (NSUInteger i = 0; i < DNA_LENGTH; i++) {
    if([DNA objectAtIndex:i] != [(*cell).DNA objectAtIndex:i])
        count++;
    }

    return count;

}

- (NSString *)description
{
    return [DNA componentsJoinedByString:@""];
}

@end
