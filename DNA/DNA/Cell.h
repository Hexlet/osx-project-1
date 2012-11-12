//
//  Cell.h
//  DNA
//
//  Created by Oleg on 05.11.12.
//  Copyright (c) 2012 Oleg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{
    NSMutableArray * DNA;
    int sizeofDNA;
}
- (int)hammingDistance:(Cell*)foreinCell;
- (NSString*)randomNuclide;
@end
