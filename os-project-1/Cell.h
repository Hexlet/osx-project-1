//
//  Cell.h
//  os-project-1
//
//  Created by Михаил Поспелов on 24.02.13.
//  Copyright (c) 2013 Михаил Поспелов. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Cell : NSObject

@property NSMutableArray *DNA;

-(int) hammingDistance:(Cell *) cell;
@end
