//
//  Cell.h
//  DNA
//
//  Created by Павел Матвиенко on 02.11.12.
//  Copyright (c) 2012 MaMa Creative Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(id) init;
-(int) hammingDistance:(Cell *) cell;

@end
