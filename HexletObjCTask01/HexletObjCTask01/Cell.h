//
//  Cell.h
//  HexletObjCTask01
//
//  Created by Mykola Makhin on 11/7/12.
//  Copyright (c) 2012 Mykola Makhin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
-(int)hammingDistance:(Cell*)otherCell;
-(NSMutableArray*)getDna;
-(Cell*)clone;
@end

@interface Cell (mutation)
-(void)mutate:(int)percent;
@end
