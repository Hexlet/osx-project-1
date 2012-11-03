//
//  Cell.m
//  dna
//
//  Created by Ilya Batozskiy on 31.10.12.
//  Copyright (c) 2012 Ilya Batozskiy. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init{
        self = [super init];
        if (self){
                _DNAamount = 100;
                int amino;
                _DNA = [[NSMutableArray alloc] initWithCapacity:100];
                _DNAtypes = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil]; //массив типов аминокислот
                for (int i=0; i<_DNAamount; i++) {
                        amino = arc4random()%[_DNAtypes count]; // выбираю один из вариантов аминокислот
                        [_DNA addObject:[_DNAtypes objectAtIndex:amino]];
                    }
            }
        return self;
    }

-(int) hammingDistance:(Cell *)anotherCell{
        int count=_DNAamount;
        for (int i=0; i<_DNAamount; i++) {
                if ([[_DNA objectAtIndex:i] isEqual:[anotherCell.DNA objectAtIndex:i]] ) {
                        count--;
                    }
            }
        return count;
    }


@end

