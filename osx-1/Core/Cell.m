//
//  Cell.m
//  osx-1
//
//  Created by Александр Турченко on 30.10.12.
//  Copyright (c) 2012 TurchenkoAlex. All rights reserved.
//

#import "Cell.h"
#import "DNA.h"

@implementation Cell

-(int)randomDNAIndex{
    return random() % DNALength;
}

-(NSString *)randomDNASymbol{
    return DNASymbols[[self randomDNAIndex]];
}

-(NSMutableArray *)createDNAArrayWithCapacity:(NSUInteger)theCapacity{
    NSMutableArray *dnaArray = [[NSMutableArray alloc] initWithCapacity:theCapacity];
    for (int i = 0; i < theCapacity; ++i) {
        [dnaArray setObject:[self randomDNASymbol] atIndexedSubscript:i];
    }
    return dnaArray;
}

-(id)init{
    self = [super init];
    if (self) {
        _DNA = [self createDNAArrayWithCapacity:100];
    }
    return self;
}

-(NSString *)description{
    return [_DNA componentsJoinedByString:@""];
}

-(int)hammingDistance:(Cell *)otherCell{
    NSInteger counter = 0;
    NSUInteger length = [_DNA count];
    NSUInteger otherLength = [[otherCell DNA] count];
    if (otherLength < length){
        counter = length - otherLength;
        length = otherLength;
    }
    for(NSUInteger i = 0; i < otherLength; ++i){
        if(! [_DNA[i] isEqualTo:[otherCell DNA][i]])
        {
            ++counter;
        }
    }
    return (int)counter;
}

@end
