//
//  Cell.h
//  osx-1
//
//  Created by Александр Турченко on 30.10.12.
//  Copyright (c) 2012 TurchenkoAlex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly) NSMutableArray *DNA;

-(NSString *)dnaAsString;
-(int)hammingDistance:(Cell *)otherCell;

@end
