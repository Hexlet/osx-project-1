//
//  DNA.h
//  DNA
//
//  Created by Artem Abramov on 11/13/12.
//  Copyright (c) 2012 Artem Abramov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNA : NSObject

@property NSMutableArray * molecules;

-(int)hammingDistance: (DNA *) compareDNA;

@end
