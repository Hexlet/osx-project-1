//
//  Cell.h
//  DnaProject
//
//  Created by wolfmetr on 02.11.12.
//  Copyright (c) 2012 wolfmetr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property (nonatomic,retain) NSMutableArray *DNA;
@property (nonatomic,retain) NSArray *charSet;

-(int) hammingDistance:(Cell *) d;

@end
