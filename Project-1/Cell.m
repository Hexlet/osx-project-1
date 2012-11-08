//
//  Cell.m
//  Project-1
//
//  Created by Roman Nekhoroshev on 04.11.12.
//  Copyright (c) 2012 Roman Nekhoroshev. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize DNA;

-(id) init {
    self = [super init];
    if (self) {
        int maxDNA = 100;
        DNA = [[NSMutableArray alloc] initWithCapacity:maxDNA];
        
        posibleNucleotides = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        
        for (int i = 0; i < maxDNA; i++) {
            NSString *nucleotide;
            nucleotide = [posibleNucleotides objectAtIndex: arc4random() % [posibleNucleotides count]];
            [DNA addObject: nucleotide];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)anotherCell {
    int counter = 0;
    NSEnumerator *anothersEnum = [[anotherCell DNA] objectEnumerator];
    for (NSString *nucleotide in DNA) {
        if (nucleotide != [anothersEnum nextObject]) {
            counter++;
        }
    }
    
//    for (int i = 0; i < [DNA count]; i++) {
//        if ([DNA objectAtIndex: i] != [[anotherCell DNA] objectAtIndex: i]) {
//            counter++;
//        }
//    }

    return counter;
}


-(void) print {
    if (DNA) {
        NSString *joinedDNA = [[DNA valueForKey:@"description"] componentsJoinedByString:@""];
        NSLog(@"%@", joinedDNA);
    }
}

@end
