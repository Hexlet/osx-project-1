//
//  Cell.h
//  DNA
//
//  Created by dk on 04.11.12.
//  Copyright (c) 2012 dk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property NSMutableArray *dna;

-(id) init;
-(void) print;
-(int) hummingDistance: (Cell*) cell;

@end
