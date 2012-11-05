//
//  Cell.h
//  Hexlet_DNA
//
//  Created by evgenzh on 10/30/12.
//  Copyright (c) 2012 evgenzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
	NSArray *chromosome;
}
@property NSMutableArray *dna;

- (int)hammingDistance:(Cell*)cell;

@end

@interface Cell (mutator)

- (void)mutate:(int)percent;

@end

@interface Cell (dna_showing)

- (NSString*)getDNA;

@end