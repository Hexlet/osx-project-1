//
//  Cell.h
//  HW1-DNA
//
//  Created by Victor Gafiatulin on 05.11.12.
//  Copyright (c) 2012 Victor Gafiatulin. All rights reserved.
//

#import <Foundation/Foundation.h>
#define capacity 100

@interface Cell : NSObject
{
    NSMutableArray *DNA;
}

@property (readonly, nonatomic, strong) NSArray *nucleobase;

- (int)hammingDistance: (Cell*)anotherCell;
- (NSMutableArray*)DNA;
@end
