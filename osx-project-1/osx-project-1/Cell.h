//
//  Cell.h
//  osx-project-1
//
//  Created by MikSer on 05.11.12.
//  Copyright (c) 2012 MikSer. All rights reserved.
//

#import <Foundation/Foundation.h>

#define X 100

@interface Cell : NSObject
{
	NSArray *fill;
	NSMutableArray *dna;
}

- (int)hammingDistance:(Cell *)cell2;
- (int)count;

@end