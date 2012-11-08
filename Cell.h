//
//  Cell.h
//  Untitled
//
//  Created by Alex on 06.11.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#define N_CHARS 100
#define N_CHARSET 4
extern NSString *chars[];

@interface Cell : NSObject {
}
-(id)init;
-(int)hammingDistance:(Cell *)cell;
@property (readonly) NSMutableArray *DNA;
@end
