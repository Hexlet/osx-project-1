//
//  Cell.h
//  hw1
//
//  Created by stas on 05.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "setting.h"

@interface Cell : NSObject {
    NSMutableArray *DNA;
}

-(int)hammingDistance:(Cell *) cell;

@end
