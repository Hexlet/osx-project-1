//
//  Cell.h
//  DNA
//
//  Created by Alex on 11/13/12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(int) hammingDistance: (Cell*)other;
-(NSString*) getRandomGenom;
-(void)Print;

@end

@interface Cell (mutator)

-(void) mutate: (int)count;

@end
