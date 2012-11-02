//
//  Cell.m
//  HexletProject1DNA
//
//  Created by Sviatoslav on 02.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize DNA=_DNA;

- (id)init{
    self = [super init];
    if (self) {
        _DNA = [[NSMutableArray alloc] initWithCapacity:DNA_SIZE];
        for (NSInteger i = 0; i < DNA_SIZE; i++)
            [_DNA addObject:[self randomDNASymbol]];        
    }
    return self;
}

- (NSInteger)hammingDistance:(Cell *)cell{
    if ([cell.DNA count] != [_DNA count])
        [NSException raise:@"Wrond DNA size in incoming cell" format:@"current DNA size %lu, incoming DNA size %lu", [_DNA count], [cell.DNA count]];
                 
    NSInteger hamming_distance = 0;
    for (NSUInteger i = 0; i < [cell.DNA count]; i++)
        if (![[_DNA objectAtIndex:i] isEqualToString:[cell.DNA objectAtIndex:i]] )
            hamming_distance++;
    return hamming_distance;    
}




- (NSString*)randomDNASymbol{   
    return [DNA_SYMBOLS_ALLOWED substringWithRange:(NSRange){(arc4random() % [DNA_SYMBOLS_ALLOWED length]), 1}];
}


-(NSString*)description{    
    NSMutableString * description = [[NSMutableString alloc] initWithCapacity:[_DNA count]];
    for(NSString * character in _DNA)        
        [description appendFormat:@"%@", character];
    return description;    
}
@end
