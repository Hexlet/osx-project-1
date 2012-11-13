//
//  Cell.h
//  ProjectOne
//
//  Created by Pavel Gerashchenko on 09.11.12.
//  Copyright (c) 2012 Pavel Gerashchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    int i,r;
    int percent;
    NSMutableArray *arrayTemp;
    NSArray *chars;
    NSMutableArray *DNA;

}
-(id)init;
-(int)hammingDistance:(Cell *)cell;
@property (readonly)  NSMutableArray *DNA;


@end
