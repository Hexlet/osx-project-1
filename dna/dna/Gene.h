//
//  Gene.h
//  dna
//
//  Created by Evgeny Trefilov on 11/4/12.
//  Copyright (c) 2012 Evgeny Trefilov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gene : NSObject

@property (strong) NSString* value;

-(void)mutate;

@end
