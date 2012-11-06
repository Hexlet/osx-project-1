//
//  Cell.h
//  osx-project-1
//
//  Created by Alexander Galato on 06.11.12.
//  Copyright (c) 2012 Alexander Galato. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSString *values;
}
@property NSMutableArray *DNA;
- (int) hammingDistance: (Cell *) toComp;
@end

@interface Cell (Mutator)
- (void) mutator: (int) percent;
@end