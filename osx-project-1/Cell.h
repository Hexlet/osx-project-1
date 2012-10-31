//
//  Cell.h
//  osx-project-1
//
//  Created by Serge Kristal on 31.10.12.
//  Copyright (c) 2012 Salakhutdinov Shaukat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
	NSArray *gen;
	NSMutableArray *dna;
}

- (int)count;
- (int)hammingDistance:(Cell *)cell2;
- (void)print;

@end