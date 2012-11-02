//
//  Cell.h
//  osx-project-1
//
//  Created by Alexander Kazanskiy on 30.10.12.
//  Copyright (c) 2012 haxlet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject  {
    NSMutableArray * DNA;
    int capacity;
}

-(int) hummingDistance: (Cell*) c;
+(id) getRandGen;

@end
