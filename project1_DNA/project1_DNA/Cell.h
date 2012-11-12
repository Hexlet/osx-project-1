//
//  Cell.h
//  p1DNA
//
//  Created by karga12 on 11.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (nonatomic, retain) NSMutableArray *array;


-(id)init;
-(int)hammingDistance:(Cell*)cell;

-(void)print;

@end

@interface Cell (mutator)
-(void)mutate:(int)X;
@end