//
//  Cell.h
//  project_1
//
//  Created by serg on 31.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

-(int) hammingDistance: (Cell*)cell; 
@property NSMutableArray *DNA;
@property NSArray *array ;
@end
