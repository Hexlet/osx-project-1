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
    NSMutableArray *DNA;
    NSArray *nucleotides;
}
- (Cell*)init;
- (int)hammingDistance:(Cell *)target;
- (NSString *)description;
@end
