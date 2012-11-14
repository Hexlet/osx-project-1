//
//  Cell.h
//  DNA
//
//  Created by Alex Demchenko on 12.11.12.
//  Copyright (c) 2012 Alex Demchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
}

-(id) init;
-(int) hammingDistance: (Cell *) cellObject;

@end
