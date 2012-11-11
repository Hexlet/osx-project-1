//
//  Cell.m
//  helloworld
//
//  Created by Volodia on 10.11.12.
//
//

#import "Cell.h"
#include <stdlib.h> // for arc4random

#define DNA_LENGTH 100

@implementation Cell {
    NSMutableArray * DNA;
}

-(id) init {
    // TODO: somehow make this static
    Nucleotide * A = [[Nucleotide alloc] initWithName:@"A"];
    Nucleotide * T = [[Nucleotide alloc] initWithName:@"T"];
    Nucleotide * G = [[Nucleotide alloc] initWithName:@"G"];
    Nucleotide * C = [[Nucleotide alloc] initWithName:@"C"];
    
    NSArray * nucleotides = [NSArray arrayWithObjects:A, T, G, C, nil];
    
    self = [super init];
    if (self) {
        DNA = [NSMutableArray arrayWithCapacity:DNA_LENGTH];
        for (int i = 0; i < DNA_LENGTH; i++) {
            int random = arc4random() % 4;
            [DNA insertObject:nucleotides[random] atIndex:i];
        }
        
    }
    return self;
}

-(Nucleotide *) nucleoAtIndex:(int) index {
    return (Nucleotide *)[DNA objectAtIndex:index];
}

-(void) setNucleo:(Nucleotide *) nucleo atIndex:(int) index {
    [DNA replaceObjectAtIndex:index withObject:nucleo];
}

-(int) hammingDistance: (Cell *) cell {
    int distance = 0;
    for (int i = 0; i < DNA_LENGTH; i++) {
        Nucleotide * currentNucleo = [self nucleoAtIndex:i];
        Nucleotide * cellNucleo = [cell nucleoAtIndex:i];
        if (![currentNucleo isEqualTo:cellNucleo]) {
            distance++;
        }
    }
    return distance;
}

-(NSString *) description {
    NSMutableString * desc = [[NSMutableString alloc] initWithCapacity:100];
    if (desc) {
        for (Nucleotide * nucleo in DNA) {
            [desc appendString:nucleo.name];
        }
    }
    return desc;
}

@end
