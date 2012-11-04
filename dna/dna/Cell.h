//
//  Cell.h
//  dna
//
//  Created by Igor Pavlov on 02.11.12.
//  Copyright (c) 2012 Igor Pavlov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Cell : NSObject <NSCopying>
{
    NSMutableArray  *dna;
}

+ (NSUInteger)  getDnaAlphabetSize;
+ (const char*) getDnaAlphabet;
+ (NSUInteger)  getAlphabetCharIndex:(char)c;

- (id)    init;
- (int)   hammingDistance:(Cell*)otherCell;

@end
