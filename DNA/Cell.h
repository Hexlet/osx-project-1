//
//  Cell.h
//  DNA
//
//  Created by Admin on 11/2/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property (readonly) NSMutableArray *DNA;
-(int) hammingDistance: (Cell*) c;
@end
