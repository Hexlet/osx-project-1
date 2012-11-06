//
//  Cell.m
//  DNI
//
//  Created by Qik on 11/4/12.
//  Copyright (c) 2012 Qik. All rights reserved.
//

#import "Cell.h"
#import <Foundation/Foundation.h>



@implementation Cell
-(id) init{
    self = [super init];
    if(self){
        _nucleotids = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
        _dna = [[NSMutableArray alloc] init];
        for (int i=0; i<100; i++) {
            [_dna addObject:[self getRandomNucleotid]];
        }
    }
    return self;
}
-(void) print{
    NSLog(@"%@", _dna); 
}

-(NSString *)getRandomNucleotid {
    return [_nucleotids objectAtIndex:arc4random_uniform((int)[_nucleotids count])];
}

-(int)hammingDistance:(Cell*)cell{
    int distance = 0;
    NSMutableArray *this = [self dna];
    NSMutableArray *other = [cell dna];
    for (int i=0;i<[this count]; i++){
        if (![[this objectAtIndex:i] isEqualToString:[other objectAtIndex:i]]){
            distance++;
        }
    }
    return distance;
}

-(Cell*) copy{
    Cell *newCell = [[Cell alloc] init];
    [newCell setDna:[[self dna] copy]];
    return newCell;
}
@end
