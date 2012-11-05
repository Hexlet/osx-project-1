//
//  Cell.h
//  myDna
//
//  Created by Sergii on 10/31/12.
//  Copyright (c) 2012 Sergii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

// overrided init & custom initWithCapacity
-(id) init;
-(id) initWithCapacity:(int)count;

-(NSString*) getRandom;
-(int) hammingDistance: (NSMutableArray*) otherDNA;

-(void) printDNA;

@end
