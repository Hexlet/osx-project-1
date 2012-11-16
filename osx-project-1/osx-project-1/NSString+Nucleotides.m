//
//  NSString+Nucleotides.m
//  osx-project-1
//
//  Created by Victor Mylcin on 09.11.12.
//  Copyright (c) 2012 Victor Mylcin. All rights reserved.
//

#import "NSString+Nucleotides.h"

@implementation NSString (Nucleotides)

-(NSString *) randomNucleotide: (NSString *) excludeAt {
    NSMutableArray *arrayATGC = [NSMutableArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    // возвращаем случайный нуклеотид из возможных за исключением повторного
    if (excludeAt)
        [arrayATGC removeObjectIdenticalTo:excludeAt];
    return [arrayATGC objectAtIndex: random() % [arrayATGC count]];
}

@end
