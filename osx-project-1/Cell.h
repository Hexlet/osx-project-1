//
//  Cell.h
//  osx-project-1
//
//  Created by Yuriy Zarovnuy on 07.11.12.
//  Copyright (c) 2012 Yuriy Zarovnuy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
        NSMutableArray *DNA;
}

@property (readonly) int DNALength;

-(int) hammingDistance: (Cell*) other;

@end
