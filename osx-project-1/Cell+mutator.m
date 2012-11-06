//
//  Cell+mutator.m
//  osx-project-1
//
//  Created by Serge Kristal on 31.10.12.
//  Copyright (c) 2012 Salakhutdinov Shaukat. All rights reserved.
//

#import "Cell.h"
#import "Cell+mutator.h"

@implementation Cell (mutator)


- (void)mutate:(int)percent
{
	int replaceCount = ( percent * DNA_SIZE ) / 100;
	NSMutableString *printString = [[NSMutableString alloc] initWithString:[@"" stringByPaddingToLength:DNA_SIZE withString:@" " startingAtIndex:0]];
	
	while ( replaceCount > 0 ) {
		
		int ind = arc4random() % 4;
		int rnd = arc4random() % DNA_SIZE;
		
		if ( ![gen[ind] isEqual:[dna objectAtIndex:rnd]] && [printString characterAtIndex:rnd] != '*' ) {
			[dna replaceObjectAtIndex:rnd withObject:gen[ind]];
			[printString replaceCharactersInRange:NSMakeRange(rnd, 1) withString:@"*"];
			--replaceCount;
		}
		
	}
	
	NSLog(@"%@", self.description);
	NSLog(@"%@", printString);
	
//	int k = 0;
//	for (int i=0; i<printString.length; ++i) {
//		if ([printString characterAtIndex:i] == '*')
//			++k;
//	}
//	NSLog(@"k = %d", k);
}


@end
