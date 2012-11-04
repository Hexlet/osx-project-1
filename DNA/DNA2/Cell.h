//
//  Cell.h
//  DNA2
//
//  Created by Alexey Fedotov on 04.11.12.
//  Copyright (c) 2012 Alexey Fedotov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;
@property NSArray *source;

-(int)hammingDistance: (Cell *) cell;

@end
