//
//  Cell.h
//  ProjectOne_DNK
//
//  Created by Максим on 30.10.12.
//  Copyright (c) 2012 CarelessApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;
@property int errorRows;

-(int)hammingDistance: (id)cellObject;

@end
