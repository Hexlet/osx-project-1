//
//  Cell.h
//  osx-project-1
//
//  Created by sergeich on 07.11.12.
//  Copyright (c) 2012 sergeich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    
}

@property (readonly) NSMutableArray *DNA;
@property (readonly) NSArray *genes;

- (int)hammingDistance:(Cell *) cell;

@end
