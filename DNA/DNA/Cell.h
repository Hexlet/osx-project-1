//
//  Cell.h
//  DNA
//
//  Created by Moonkid on 10/31/12.
//  Copyright (c) 2012 Moonkid. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface Cell : NSObject {
    NSMutableArray *dna;
}

@property(readonly) NSMutableArray *dna;

- (NSString *)generateRandomSymbol;
- (int) hammingDistance:(Cell *)cell;

@end