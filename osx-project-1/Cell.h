//
//  Cell.h
//  osx-project-1
//
//  Created by Vadim on 03.11.12.
//  Copyright (c) 2012 Vadim. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(void) print;
-(int) hammingDistance: (Cell*) F;
-(char) randomChar;

@end
