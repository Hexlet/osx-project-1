//
//  Cell.h
//  myDna
//
//  Created by Sergii on 10/31/12.
//  Copyright (c) 2012 Sergii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    NSMutableArray *DNA;
}

-(id) init;
-(id) initWithCapacity:(int)count;

-(NSString*) getRandom;
-(NSMutableArray*) getDNA;
-(int) hammingDistance: (NSMutableArray*) otherDNA;

-(void) printDNA;

@end
