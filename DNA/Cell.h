//
//  Cell.h
//  DNA
//
//  Created by Nik on 05.11.12.
//  Copyright (c) 2012 Nik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;
@property NSArray *dnaKeys;
@property int Capacity;

-(void) setCapacity: (int) c;
-(int) hammingDistance: (Cell *)cell;
-(void) print;


@end


@interface Cell (mutation)

-(void) mutate: (int) p;

@end
