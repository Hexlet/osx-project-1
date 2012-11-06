//
//  Cell.h
//  TestDNA
//
//  Created by Alex Vasilchenko on 01.11.12.
//  Copyright (c) 2012 Alex Vasilchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    unsigned int arrayCapacity;
    NSArray *dnaArray;
}

@property (readonly, nonatomic) NSMutableArray *dna;

-(int)hammingDistance:(Cell*)c;

@end
