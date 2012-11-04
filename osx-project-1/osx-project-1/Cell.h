//
//  Cell.h
//  osx-project-1
//
//  Created by Sergey Kondratyev on 01.11.12.
//  Copyright (c) 2012 Sergey Kondratyev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
}
@property NSMutableArray *DNA;
- (int) hammingDistance: (Cell*) dna;
@end

