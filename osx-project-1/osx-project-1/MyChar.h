//
//  MyChar.h
//  osx-project-1
//
//  Created by Mikhail on 05.11.12.
//  Copyright (c) 2012 Mikhail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyChar : NSObject

@property char value;

+(MyChar*) CharWithValue:(char) v;

@end
