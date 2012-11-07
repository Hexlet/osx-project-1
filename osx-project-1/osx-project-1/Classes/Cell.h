//
//  Cell.h
//  osx-project-1
//
//  Created by Roman TS on 11/2/12.
//  Copyright (c) 2012 Roman TS. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Cell : NSObject

@property NSMutableArray *DNA;
@property (readonly) NSArray * markers;

-(NSUInteger) hammingDistance:(Cell *) aCell;

-(NSString *) generateNewMarker;


-(NSString *) generateNewMarkerExclude:(NSString *) marker;
@end
