//
//  Cell.h
//  DNAHomework
//
//  Created by Евгений on 04.11.12.
//  Copyright (c) 2012 Jeck labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
@protected
    NSMutableArray *_dna;
    NSArray *_nucleotides;
    int _count;
}
- (Cell *) init;
- (int) getCount;
- (NSArray *) getDna;
- (int) hammingDistance:(Cell *)target;
- (NSString *) description;

+ (id) dnaWithCount:(int)count;
@end
