//
//  Cell.h
//  Project1
//
//  Created by kest on 10/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNALength 100

@interface Cell : NSObject {
	
	NSMutableArray *DNA;

}
-(NSMutableArray *)getDNA;
-(unsigned)hammingDistance:(Cell *)cell;
-(void)printDNA;
@end
