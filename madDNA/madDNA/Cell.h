//
//  Cell.h
//  madDNA
//
//  Created by Andrey Kolomoets on 02.11.12.
//  Copyright (c) 2012 Andrey Kolomoets. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly) NSMutableArray *DNA;

- (int)hammingDistance:(Cell*)cell;

- (void)mutateAtPosition:(int)position;

@end
