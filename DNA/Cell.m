//
//  Cell.m
//  DNA
//
//  Created by Kirill Morozov on 30.10.12.
//  Copyright (c) 2012 Kirill Morozov. All rights reserved.
//

#import "Cell.h"

@implementation Cell
-(id)init {
    self = [super init];
    if (self){
        _dnkArrayLength = 100;
        _nucleotides = [NSMutableArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        if (!DNA) {
            DNA = [[NSMutableArray alloc] initWithCapacity:_dnkArrayLength];
        }
        for (int x=0;x<100;x++) {
            int nucleotides_index = arc4random() % [_nucleotides count];
            id newNucleotide = _nucleotides[nucleotides_index];
            [DNA insertObject:newNucleotide atIndex:x];
        }
    }
    return self;
}
-(int) hammingDistance: (Cell *)obj {
    int distance = 0;
    for (int i=0;i<self.dnkArrayLength;i++){
        if([[DNA objectAtIndex:i] isEqual: [obj->DNA objectAtIndex:i]])
            distance++;
    }
    return distance;
}
-(void)printDNA {
    for(id n in DNA) {
        printf("%s",[n UTF8String]);
    }
    printf("\n");
}
@end
