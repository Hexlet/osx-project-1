//
// Created by fljot on 11/6/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface Cell : NSObject

@property(nonatomic, readonly) NSMutableArray *DNA;

+ (NSString *)randomDNASymbol;

- (int)hammingDistance:(Cell *)cell;


@end