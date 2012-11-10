//
//  NucleotideGenerator.m
//  DNA
//
//  Created by Dmitry Davidov on 06.11.12.
//  Copyright (c) 2012 Dmitry Davidov. All rights reserved.
//

#import "NucleotideGenerator.h"

@implementation NucleotideGenerator

static NSArray *nucleotides;

+(void) initialize {
    nucleotides = @[@"A", @"T", @"G", @"C"];
}

+(NSString *) getRandom {
    return [nucleotides objectAtIndex: arc4random() % [nucleotides count]];
}

+(NSString *) getRandomExcept: (NSString *) nuc {
    NSUInteger index = [nucleotides indexOfObject: nuc];
    NSString * newNuc = [nucleotides objectAtIndex: (index + 1 + arc4random() % ([nucleotides count] - 1)) % [nucleotides count]];
//    NSLog(@"%@ -> %@", nuc, newNuc);
    return newNuc;
}

@end