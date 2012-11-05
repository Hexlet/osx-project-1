//
//  Cell.h
//  project_OSX1
//
//  Created by Sergey on 31.10.12.
//  Copyright (c) 2012 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *dna;

-(int) hammingDistance: (Cell *) d;


@end
