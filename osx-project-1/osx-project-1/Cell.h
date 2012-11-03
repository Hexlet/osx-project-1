//
//  Cell.h
//  osx-project-1
//
//  Created by Pavel Popchikovsky on 11/4/12.
//  Copyright (c) 2012 Pavel Popchikovsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    NSMutableArray* DNA;
}

-(id) init;
-(int) hammingDistance:(Cell*)cell;

@end
