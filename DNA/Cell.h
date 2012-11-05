//
//  Cell.h
//  DNA
//
//  Created by Viktor Yamchinov on 11/4/12.
//  Copyright (c) 2012 Viktor Yamchinov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
}
-(int) hammingDistance:(Cell *) c;
-(void) printHammingDistance:(int) hd;
@end
