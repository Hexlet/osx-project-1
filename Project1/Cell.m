//
//  Cell.m
//  Project1
//
//  Created by Sergey Atroschenko on 31.10.12.
//  Copyright (c) 2012 ASVUSER. All rights reserved.
//

#import "Cell.h"

int const kMaxDNASize = 100;
char const kDNATypes[] = {'A', 'T', 'G', 'C' };
int const kDNATypesLenght = 4;

@interface Cell () {
}

-(void) fillDNA;

@end

@implementation Cell

#pragma mark - Initialization.
-(id) init {
    self = [super init];
    if( self != nil ) {
        _DNA = [[NSMutableArray alloc] initWithCapacity: kMaxDNASize];
        
        [self fillDNA];
    }
    return self;
}

#pragma mark - Private methods.
-(void) fillDNA {
    [_DNA removeAllObjects];
    for( int i = 0 ; i < kMaxDNASize ; i++ ) {
        int index = arc4random() % kDNATypesLenght;
        [_DNA addObject: [NSNumber numberWithChar: kDNATypes[ index ]]];
    }
}


#pragma mark - Public methods.
-(NSString*) description {
    NSMutableString *string = [NSMutableString stringWithString: @"DNA["];
    for( NSNumber *number in _DNA ) {
        char ch = [number charValue];
        [string appendFormat: @"%c", ch];
    }
    [string appendString: @"]."];
        
    return string;
}

-(NSUInteger) hammingDistance: (Cell*)otherCell {
    NSUInteger distance = 0;
    for( int i = 0 ; i < kMaxDNASize ; i++ ) {
        char ch1 = [[_DNA objectAtIndex: i] charValue];
        char ch2 = [[otherCell.DNA objectAtIndex: i] charValue];
        
        if( ch1 != ch2 ) {
            distance++;
        }
    }
    
    return distance;
}

@end
