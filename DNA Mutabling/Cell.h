//
//  Cell.h
//  DNA Mutabling
//
//  Created by Artem Aminov on 11/8/12.
//  Copyright (c) 2012 Artem Aminov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray* DNA;
@property int nucleotidsCount;
@property (readonly) NSArray* nucleotids;

-(id)init:(int)withCount;
-(int)hammingDistance:(Cell*)cell;

@end
