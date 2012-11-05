//
//  Cell.h
//  madDNA
//
//  Created by Andrey Kolomoets on 02.11.12.
//  Copyright (c) 2012 Andrey Kolomoets. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

- (int)hammingDistance:(Cell*)cell;

- (void)mutateAtPosition:(int)position;

- (id)charAtPosition:(int)position;

@end
