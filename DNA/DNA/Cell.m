//
//  Cell.m
//  DNA
//
//  Created by Roman on 31.10.12.
//  Copyright (c) 2012 BlackGray. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init
{
    self = [super init];
    if (self) {
        
        dna = [[NSMutableArray alloc]init];
        variety = [[NSArray alloc]initWithObjects:@"A",@"T",@"G",@"C", nil];
        
        for (int i = 0; i<100; i++) {
            [dna addObject:[variety objectAtIndex:(arc4random() % 4)]];
            //NSLog(@"index%d = %@",i,[dna objectAtIndex:i]);
        }
    }
    return self;
}


-(int)hammingDistance:(Cell *)otherDna
{
    int differenceNumber = 0;
    for (int i = 0; i<100; i++) {
        if (!([[otherDna getDna] objectAtIndex:i]==[dna objectAtIndex:i])) {
            differenceNumber++;
        }
    }
    return differenceNumber;
}


-(NSMutableArray*)getDna{
    return dna;
}

@end
