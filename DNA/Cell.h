//
//  Cell.h
//  DNA
//
//  Created by Vlad on 03.11.12.
//  Copyright (c) 2012 Vlad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (assign) NSMutableArray *DNA;

-(int) hammingDistance:(Cell *) anotherCell;

@end
