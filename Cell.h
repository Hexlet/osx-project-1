//
//  Cell.h
//  DNA
//
//  Created by Alexander on 30.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


#define kDNALength 100
#define kMaxDNAItems 4
extern const unichar DNAItems[kMaxDNAItems];

@interface Cell : NSObject
{
    NSMutableArray *dna;
}

@property (nonatomic, readonly) NSArray *dna;

+ (id) cell;

- (unsigned) hammingDistance: (Cell *) cell;

@end