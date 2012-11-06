//
//  Cell.h
//  1prj-deenka
//
//  Created by Wladi on 05.11.12.
//  Copyright (c) 2012 noorg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

- (int) hammingDistance: (Cell*) partner;

// for debug only?
- (void) print;

@end
