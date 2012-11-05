//
//  Cell.h
//  DNA_OSX
//
//  Created by aquaxp on 11/6/12.
//  Copyright (c) 2012 aquaxp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property (readonly) NSMutableArray *DNA;
-(int)hammingDistance:(Cell*) cll;
@end
