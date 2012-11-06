//
//  Cell.m
//  DNA
//
//  Created by Kirill Morozov on 30.10.12.
//  Copyright (c) 2012 Kirill Morozov. All rights reserved.
//

#import "Cell.h"

@implementation Cell
static NSArray *nucleotidesArray;
static NSArray *noIndex;

+ (void) initialize
{
    nucleotidesArray = [[NSArray alloc] initWithObjects: @"A", @"T", @"G", @"C", nil];
    noIndex = [[NSArray alloc] initWithObjects:@[@1,@2,@3],@[@0,@2,@3],@[@1,@0,@3],@[@1,@2,@0], nil];
}

+ (NSArray *) nucleotides
{
    return nucleotidesArray;
}

+ (NSArray *) noCurrentIndex
{
    return noIndex;
}

-(id)init {
    self = [super init];
    if (self){
        DNA = [[NSMutableArray alloc] initWithCapacity:DNA_LEN];
        for (int x=0;x<DNA_LEN;x++) {
            [DNA addObject:[[Cell nucleotides] objectAtIndex:arc4random() % NUKE_LEN]];
        }
    }
    return self;
}

-(int) hammingDistance: (Cell *)obj {
    int distance = 0;
    for (int i=0;i<DNA_LEN;i++){
        if(![[DNA objectAtIndex:i] isEqual: [obj->DNA objectAtIndex:i]])
            distance++;
    }
    return distance;
}

-(NSString *) description {
    return [NSString stringWithFormat:@"DNA: %@", [DNA componentsJoinedByString:@""]];
}

@end
