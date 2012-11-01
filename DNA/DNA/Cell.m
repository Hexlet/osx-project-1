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
                int amino;
                _DNA = [[NSMutableArray alloc] initWithCapacity:100];
                _DNAtypes = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil]; //массив типов ДНК
                for (int i=0; i<100; i++) {
                        amino = arc4random()%4;
                        [_DNA addObject:[_DNAtypes objectAtIndex:amino]];
                    }
            }
        return self;
    }

-(int) hammingDistance:(Cell *)anotherCell{
        int count=100;
        for (int i=0; i<100; i++) {
                if ([[_DNA objectAtIndex:i] isEqual:[anotherCell.DNA objectAtIndex:i]] ) {
                        count--;
                    }
            }
        return count;
    }


@end

