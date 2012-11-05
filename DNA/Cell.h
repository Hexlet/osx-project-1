//
//  Cell.h
//  DNA
//
//  Created by Andrey Shemanovskiy on 05.11.12.
//  Copyright (c) 2012 andrey.shemanovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *dna;
@property (readonly) NSArray *codonArray;

- (int)hammingDistance:(Cell *)testDNA;

@end
