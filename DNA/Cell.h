//
//  Cell.h
//  DNA
//
//  Created by Sergey Mitskevich on 11/4/12.
//  Copyright (c) 2012 Sergey Mitskevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNAItemValueOptions;
    int DNALength;
}

@property NSMutableArray *DNA;

- (void) logDNA;
- (int) hammingDistance: (Cell *) otherCell;
- (NSString *) getRandomDNAItemValue;
- (NSString *) getRandomDNAItemValueExcept: (NSString *) itemValue;

@end
