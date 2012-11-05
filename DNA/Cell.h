//
//  Cell.h
//  DNA
//
//  Created by Sergey Mitskevich on 11/4/12.
//  Copyright (c) 2012 Sergey Mitskevich. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_LENGTH  100
#define NUCLEOTIDES @[@"A", @"T", @"G", @"C"]

@interface Cell : NSObject {
    NSArray * nucleotides;
}

@property NSMutableArray *DNA;

- (void) logDNA;
- (int) hammingDistance: (Cell *) otherCell;
- (NSString *) getRandomDNAItemValue;
- (NSString *) getRandomDNAItemValueExcept: (NSString *) itemValue;

@end
