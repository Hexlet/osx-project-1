//
//  Cell.h
//  DNK
//
//  Created by Admin on 05.11.12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

-(int) hammingDistance:(Cell*) prob1;
-(id) getCell:(int) n;

@end

@interface Cell (mutator)

-(void) mutate:(int) mut;

@end
