//
//  Cell.h
//  DNA
//
//  Created by Dmitry Davidov on 04.11.12.
//  Copyright (c) 2012 Dmitry Davidov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    
    @private NSMutableArray *DNA;
    
}

-(int) hammingDistance:(Cell *)cell;

-(void) print;

@end
