//
//  Cell+Mutate.m
//  osx-project-1
//
//  Created by MikSer on 06.11.12.
//  Copyright (c) 2012 MikSer. All rights reserved.
//

#import "Cell.h"
#import "Cell+mutate.h"

@implementation Cell (mutator)


- (void)mutate:(int)percent
{
	int qntSymbols = ( percent * X ) / 100;
	NSMutableString *printString = [[NSMutableString alloc] initWithString:[@"" stringByPaddingToLength:X withString:@" " startingAtIndex:0]];
	
	while ( qntSymbols > 0 ) {
		int ind = arc4random() % 4;
		int rnd = arc4random() % X;
		if ( ![fill[ind] isEqual:[dna objectAtIndex:rnd]] && [printString characterAtIndex:rnd] != '*' ) {
			[dna replaceObjectAtIndex:rnd withObject:fill[ind]];
			[printString replaceCharactersInRange:NSMakeRange(rnd, 1) withString:@"*"];
			--qntSymbols;
		}
		
	}
	NSLog(@"%@", self.description);
	NSLog(@"%@", printString);
	
}


@end
