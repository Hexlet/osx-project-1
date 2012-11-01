//
//  Cell.h
//  DNANickToverovskiy
//
//  Created by Nick Toverovskiy on 30.10.12.
//  Copyright (c) 2012 Nick Toverovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *dna;

- (int) hammingDistance: (Cell*) cell;
- (NSString *) getRandomNucleobaseChar;

@end
