//
//  DNARange.h
//  osx-project-1
//
//  Created by Pavel Nikitin on 11/4/12.
//  Copyright (c) 2012 Pavel Nikitin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNARange : NSObject

@property NSArray *range;

-(id) randomElement;
-(id) randomButNot:(id)excludeElement;

@end
