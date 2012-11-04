//
//  Cell.m
//  Project1-DNA
//
//  Created by Administrator on 31.10.12.
//  Copyright (c) 2012 Mykhailo Oleksiuk. All rights reserved.
//
#import "Cell.h"

#define DEFAULT_DNA_SIZE 100

@implementation Cell 

+ (NSArray *)nucleobases {
    static NSArray *arrayOfNucleobases = nil;
    
    if (arrayOfNucleobases == nil) {
        arrayOfNucleobases = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
    }
    
    return arrayOfNucleobases;
}

- (id)init {
    
    if ((self = [super init])) {
        _dna = [NSMutableArray arrayWithCapacity:DEFAULT_DNA_SIZE];
        
        for(int i = 0; i < DEFAULT_DNA_SIZE; i++) {
            int randomIndex = [Random randomInteger:4];
            [_dna addObject:[[Cell nucleobases] objectAtIndex:randomIndex]];
        }
    }
    
    return self;
}

- (int)hammingDistance:(Cell *)cell {
    
    int result = 0;
    
    if (cell) {
        for (int i = 0; i < self.dna.count; i++) {
            NSString *inner = [_dna objectAtIndex:i];
            NSString *outer = [[cell dna] objectAtIndex:i];
            
            if ([inner isEqualToString:outer] == NO) {
                result++;
            }
        }
    }

    return result;
}

- (NSString *)toString {
    return [self.dna componentsJoinedByString:@","];
}

@end
