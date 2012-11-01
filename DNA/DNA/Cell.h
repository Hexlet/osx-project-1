//
//  Cell.h
//  DNA
//
//  Created by Yaroslav Shukharev on 01.11.12.
//  Copyright (c) 2012 krkmetal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    enum { CELL_SIZE = 100 };
}

@property NSMutableArray* DNA;

-(id) init;

-(int) hummingDistance: (Cell *) second_cell;


@end
