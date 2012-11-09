//
//  Cell.m
//  DNA
//
//  Created by phantom on 08.11.12.
//
//

#import "Cell.h"

@implementation Cell

- init {
    self = [super init];
    
    _DNA = [NSMutableArray array];
    
    NSArray * allNucls = [Cell allNucleotides];
    
    for (int i = 0; i < [Cell DNALength]; i++) {
        NSString * nucl = [allNucls objectAtIndex:rand() % 4];
        [[self DNA] addObject:nucl];
    }
    
    return self;
}

- (NSUInteger) hammingDistance:(Cell *)other {
    int res = 0;
    
    for (int i = 0; i < [Cell DNALength]; i++) {
        if ([[self.DNA objectAtIndex:i] compare:[other.DNA objectAtIndex:i]] != NSOrderedSame) {
            res ++;
        }
    }
    
    return res;
}

- (NSString*) toString {
    return [_DNA componentsJoinedByString:@""];
}

+ (NSUInteger) DNALength {
    return 100;
}

+ (NSArray*) allNucleotides {
    return [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
}

@end
