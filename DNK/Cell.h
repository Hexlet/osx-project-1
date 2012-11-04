//
//  Cell.h
//  DNK
//
//  Created by Andrew Krylov on 31.10.12.
//  Copyright (c) 2012 Andrew Krylov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray  *dnk;


-(int) hammingDistance:(Cell *) d;

@end
