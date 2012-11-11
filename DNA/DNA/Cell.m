//
//  Cell.m
//  DNA
//
//  Created by Alex Makarov on 11/6/12.
//  Copyright (c) 2012 Alex Makarov. All rights reserved.
//

#import "Cell.h"

const char N_BASES[4] = {'A', 'T', 'G', 'C'};

@implementation Cell

- (id)init
{
    if ((self = [super init]))
	{
//		self.DNA = [[NSMutableArray alloc] init];
        _DNA = [NSMutableArray arrayWithCapacity:DNA_SIZE];
        for (int i = 0; i < DNA_SIZE; i++) 
            [_DNA addObject:[Cell getRandNBase]];    
    }
    return self;
}

+ (NSString*)getRandNBase
{
    return [NSString stringWithFormat:@"%c" , (N_BASES[arc4random() % 4])];
}

- (int)hammingDistance:(Cell *)aCell
{
	int dif = 0;
	for(int i = 0; i < DNA_SIZE; i++)
	{
		if([[self.DNA objectAtIndex:i] isEqual:[aCell.DNA objectAtIndex:i]])
			dif++;
	}
	return dif;
}

- (void)result
{
    NSLog(@"%@", _DNA);
}

@end
